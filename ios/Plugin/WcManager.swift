import Foundation
import UIKit

@objc public class WcManager: NSObject {
    var walletConnect: WalletConnect!
    var handshakeController: HandshakeViewController!
    
    @objc func echo(_ value: String) -> String {
        let connectionUrl = walletConnect.connect()
        print(connectionUrl)
        return "真正返回的值"
    }
    @objc func connect() -> String {
        return "0x88888888"
    }
    @objc func personal_sign(_ signContent: String, account: String, password: String) -> String {
        print("personal_sign called")
          print(signContent)
        print(account)
        print(password)
        return "sign res"
    }
}
