import 'dart:convert';
import 'dart:html';
import 'dart:math';
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kg_meet_tpe/domain/generate_result_info.dart';
import 'package:kg_meet_tpe/router.dart';

class GenerateWalletScreen extends StatefulWidget {
  const GenerateWalletScreen({super.key});

  @override
  State<GenerateWalletScreen> createState() => _GenerateWalletScreenState();
}

class _GenerateWalletScreenState extends State<GenerateWalletScreen> {
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
    window.onMessage.listen((event) {
      final origin = event.origin;
      if (origin == 'https://t42ji2ji.github.io') {
        final result =
            GenerateResultInfo.fromJson(event.data.cast<String, dynamic>());
        context.go(GenerateResultRoute(result.encodedSoulInfo).location,
            extra: result);
      }
    });

    iframe = IFrameElement()
      ..src = 'https://t42ji2ji.github.io/birthday_address/'
      ..style.border = 'none';
    // ignore: undefined_prefixed_name
    platformViewRegistry.registerViewFactory(
        createdViewId, (int viewId) => iframe);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff031942),
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
