import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(title: const Text('test')),
        body: Column(
          children: [
            const Center(child: Text('test')),
            const SizedBox(
              width: 320 * 1,
              height: 240 * 1,
              child: WebView(
                initialUrl: 'http://raspberrypi.local:5000/',
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      http.post(
                          Uri.parse('https:/raspberrypi.local:5000/set_stat'),
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                          body: jsonEncode(<String, dynamic>{
                            'num': 3,
                          }));
                    },
                    child: const Text('open')),
                ElevatedButton(
                    onPressed: () {
                      http.post(
                          Uri.parse('https:/raspberrypi.local:5000/set_stat'),
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                          body: jsonEncode(<String, dynamic>{
                            'num': 3,
                          }));
                    },
                    child: const Text('close'))
              ],
            )
          ],
        ));
  }
}
