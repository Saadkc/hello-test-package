package com.example.example;

import android.content.Intent;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;


public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "whatsappChannel";
    private MethodChannel methodChannel;


    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler((call, result) -> {
            if (call.method.equals("whatsapp")) {
                String text = call.argument("url");
                onClickWhatsApp(text);
            }
        });
    }

    public void onClickWhatsApp(String text) {

        Intent waIntent = new Intent(Intent.ACTION_SEND);
        waIntent.setType("text/plain");

        waIntent.setPackage("com.whatsapp.w4b");

        waIntent.putExtra(Intent.EXTRA_TEXT, text);
        startActivity(Intent.createChooser(waIntent, "Share with"));
    }
}
