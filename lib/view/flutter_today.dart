import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//import '../model/menu.dart';
import '../model/navigation_controls.dart';
import '../model/web_view_stack.dart';

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
        title: const Text('Flutter WebView'),
        actions: [
          NavigationControls(controller: controller),
          //Menu(controller: controller),
        ],
      ),
      body: WebViewStack(controller: controller),
    );
  }
}
