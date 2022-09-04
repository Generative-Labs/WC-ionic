import Foundation
import Capacitor
import UIKit
import CryptoSwift
import Network
import WalletConnectSwift

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(WcManagerPlugin)
public class WcManagerPlugin: CAPPlugin {
    var walletConnect: WalletConnect!
    var client: Client!
    var session: Session!
    var token: Any!
    var address: Any!

    @objc func connect(_ call: CAPPluginCall) {
        print("connect called")
        walletConnect = WalletConnect(delegate: self)
        let connectionUrl = walletConnect.connect()
        
        if walletConnect.session != nil && walletConnect.session.walletInfo != nil {
            let address = walletConnect.session.walletInfo!.accounts[0]
            call.resolve(["address": address])
        } else {
            /// https://docs.walletconnect.org/mobile-linking#for-ios
            /// **NOTE**: Majority of wallets support universal links that you should normally use in production application
            /// Here deep link provided for integration with server test app only
            let deepLinkUrl = "wc://wc?uri=\(connectionUrl)"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if let url = URL(string: deepLinkUrl), UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    let data = Data(connectionUrl.utf8)
                    let context = CIContext()
                    let filter = CIFilter.qrCodeGenerator()
                    filter.setValue(data, forKey: "inputMessage")

                    let outputImage = filter.outputImage!
                    let scaledImage = outputImage.transformed(by: CGAffineTransform(scaleX: 3, y: 3))
                    let cgImage = context.createCGImage(scaledImage, from: scaledImage.extent)!
                    call.resolve(["qrImage": UIImage.init(cgImage: cgImage)])
                }
            }
        }
    }
    
    @objc func get_wallet_data(_ call: CAPPluginCall) {
        print("get_wallet_data called")
        let key = call.getString("key") ?? ""
        if key == "address" {
            call.resolve([
                "value": address
            ])
        } else if key == "sign-res" {
            call.resolve([
                "value": token
            ])
        }
    }
    
    @objc func personal_sign(_ call: CAPPluginCall) {
        print("personal_sign called")
        client = walletConnect.client
        session = walletConnect.session
        print(session.walletInfo!.accounts[0])
        let signContent = call.getString("signContent") ?? "Hello World"
        let account = call.getString("account") ?? ""
        let password = call.getString("password") ?? ""
        try? client.personal_sign(url: session.url, message: signContent, account: session.walletInfo!.accounts[0]){
            [weak self] response in
            self?.handleReponse(response, expecting: "Signature")
        }
        call.resolve([
            "value": "meeage end"
        ])
    }
    
    @objc func dis_connect(_ call: CAPPluginCall) {
        print("dis_connect called")
        guard let session = session else { return }
        try? client.disconnect(from: session)
        self.address = nil
        self.token = nil
    }
    
    private func handleReponse(_ response: Response, expecting: String) -> Any {
        DispatchQueue.main.async {
            if let error = response.error {
                print("签名结果失败")
            }
            do {
                let result = try response.result(as: String.self)
                print(expecting)
                self.token = result as String
            } catch {
            }
        }
    }
}


extension WcManagerPlugin: WalletConnectDelegate {
    func failedToConnect() {
        print("failed connect")
    }

    func didConnect() {
        print("success didConnect")
        address = walletConnect.session.walletInfo!.accounts[0]
        print(walletConnect.session.walletInfo!.accounts[0])
    }

    func didDisconnect() {
        print("failed didDisconnect")
    }
}



extension UIAlertController {
    func withCloseButton() -> UIAlertController {
        addAction(UIAlertAction(title: "Close", style: .cancel))
        return self
    }

    static func showFailedToConnect(from controller: UIViewController) {
        let alert = UIAlertController(title: "Failed to connect", message: nil, preferredStyle: .alert)
        controller.present(alert.withCloseButton(), animated: true)
    }

    static func showDisconnected(from controller: UIViewController) {
        let alert = UIAlertController(title: "Did disconnect", message: nil, preferredStyle: .alert)
        controller.present(alert.withCloseButton(), animated: true)
    }
}
