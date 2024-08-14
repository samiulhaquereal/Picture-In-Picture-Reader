import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PiPPage(),
    );
  }
}


class PiPPage extends StatelessWidget {
  static const platform = MethodChannel('com.example/pip');

  Future<void> enterPiPMode() async {
    try {
      await platform.invokeMethod('enterPiP');
    } on PlatformException catch (e) {
      print("Failed to enter PiP mode: '${e.message}'.");
    }
  }

  Future<void> exitPiPMode() async {
    try {
      await platform.invokeMethod('exitPiP');
    } on PlatformException catch (e) {
      print("Failed to exit PiP mode: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picture-in-Picture Example'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: enterPiPMode,
            child: Text('Enter PiP Mode'),
          ),
          ElevatedButton(
            onPressed: exitPiPMode,
            child: Text('Exit PiP Mode'),
          ),
        ],
      ),
    );
  }
}
