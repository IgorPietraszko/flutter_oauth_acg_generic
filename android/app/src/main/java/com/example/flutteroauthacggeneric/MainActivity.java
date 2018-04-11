package com.example.flutteroauthacggeneric;

import android.content.Intent;
import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

  private static final String AUTHORIZE_CHANNEL = "flutter_oauth_acg_generic/authorize";
  private MethodChannel channel;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    channel = new MethodChannel(getFlutterView(), AUTHORIZE_CHANNEL);
  }

  @Override
  protected void onActivityResult(int requestCode, int resultCode, Intent data) {
    if (requestCode == 100)
    {
      String authorizationCode = data.getExtras().getString("code");
      channel.invokeMethod("authorize", authorizationCode);
    }    
  }
}
