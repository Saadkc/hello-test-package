import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter package'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   final methodChannel = const MethodChannel('whatsappChannel');
  Future<void> openWhatsapp(String url) async {
    try {
      await methodChannel.invokeMethod('whatsapp', {"url": url});
    } catch (e) {
      print(e);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(onPressed: () {
            print("Whatsapp");
            Whatsapp.openWhatsapp({"url": "https://wa.me/6281234567890?text=Hello%20World"});
          }, child: const Text("Whatsapp"))
        ]),
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