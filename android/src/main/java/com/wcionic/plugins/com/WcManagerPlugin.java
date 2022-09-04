package com.wcionic.plugins.com;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "WcManager")
public class WcManagerPlugin extends Plugin {

    private WcManager implementation = new WcManager();

    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", implementation.echo(value));
        print('123-test-android-plugins')
        call.resolve(ret);
    }
    @PluginMethod
    public void connect() {
        call.resolve({account: 'android-asdasdasd'});
    }
    @PluginMethod
    public void personal_sign(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", implementation.echo(value));
        print('123-test-android-plugins')
        call.resolve(ret);
    }


}
