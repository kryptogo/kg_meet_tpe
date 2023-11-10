import 'dart:convert';
import 'dart:html';
import 'dart:math';
import 'dart:ui_web';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web3 Address Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String createdViewId;
  late Future<bool?> loadHtmlFuture;
  late IFrameElement iframe;

  @override
  void initState() {
    super.initState();
    createdViewId = getRandString(10);
    loadHtmlFuture = _loadHtml();
  }

  String getRandString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  Future<bool> _loadHtml() async {
    addJSListener();

    iframe = IFrameElement()
      ..src = 'https://t42ji2ji.github.io/birthday_address/'
      ..style.border = 'none';
    // ignore: undefined_prefixed_name
    platformViewRegistry.registerViewFactory(
        createdViewId, (int viewId) => iframe);

    return true;
  }

  void addJSListener() {
    window.onMessage.listen((event) {
      var data = json.decode(event.data);
      final origin = event.origin;
      //todo check origin
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<bool?>(
          future: loadHtmlFuture,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.error != null || snapshot.data == null) {
              return const Center(child: Text('加载失败'));
            }
            return HtmlElementView(
              viewType: createdViewId,
            );
          },
        ));
  }
}
