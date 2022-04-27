import 'dart:async';

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';
import '../model/source_of_web_view.dart';
import '../controller/navigation_controller.dart';

class FlutterToday extends StatefulWidget {
  const FlutterToday({Key? key}) : super(key: key);

  @override
  State<FlutterToday> createState() => _FlutterTodayState();
}

class _FlutterTodayState extends State<FlutterToday> {
  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Today'),
        actions: [
          NavigationController(navigationController: controller),
        ],
      ),
      body: SourceOfWebView(webViewController: controller),
    );
  }
}
