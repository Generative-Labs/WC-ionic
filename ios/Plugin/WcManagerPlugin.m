#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(WcManagerPlugin, "WcManager",
           CAP_PLUGIN_METHOD(echo, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(connect, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(personal_sign, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(get_wallet_data, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(dis_connect, CAPPluginReturnPromise);
)

