import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'web_view_home.dart';

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
        title: Text(
          'FlutterToday',
          style: GoogleFonts.laila(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
      body: WebViewHome(webViewController: controller),
    );
  }
}
