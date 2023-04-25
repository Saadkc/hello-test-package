library hello;

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A Calculator.
class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {
            Whatsapp.openWhatsapp({"url": "https://wa.me/6281234567890?text=Hello%20World"});
          }, child: const Text("Whatsapp"))
        ],
      ),
    );
  }
}

class Whatsapp {
  static const MethodChannel _channel = MethodChannel('whatsappChannel');

  static Future<void> openWhatsapp(Map<dynamic,dynamic> map) async {
    try {
      await _channel.invokeMethod('whatsapp', map);
    } catch (e) {
      print(e);
    }
  }
}