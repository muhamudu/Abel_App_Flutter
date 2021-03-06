package com.shopping_cart

import android.content.Intent
import android.os.Bundle
import android.util.Log

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private val REQUEST_SHARE: Int = 101
    val CHANNEL = "flutter.native/helper"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { methodCall, result ->
            if (methodCall.method.equals("shareApp", true)) {
                Log.d("SHARE", "true")
                shareApp()
                result.success("Shared")
            }
        }
    }

    private fun shareApp() {
        val intent = Intent()
        intent.action = Intent.ACTION_SEND_MULTIPLE
        intent.type = "*/*"
        intent.putExtra(Intent.EXTRA_TEXT, "Share App Link")
        startActivityForResult(intent, REQUEST_SHARE)

    }
}
