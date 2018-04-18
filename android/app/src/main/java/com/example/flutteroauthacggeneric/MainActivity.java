package com.example.flutteroauthacggeneric;

import android.content.Intent;
import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity implements MethodChannel.MethodCallHandler {

  private static final String AUTHORIZE_CHANNEL = "flutter_oauth_acg_generic/authorize";
  private static MethodChannel channel;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    channel = new MethodChannel(getFlutterView(), AUTHORIZE_CHANNEL);
    channel.setMethodCallHandler(this);
  }
}
