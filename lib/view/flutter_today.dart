import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../model/happy_theme.dart';
import '../controller/dashboard_home.dart';

HappyTheme happyTheme = HappyTheme();

class FlutterToday extends StatelessWidget {
  const FlutterToday({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Today',
      theme: happyTheme.buildTheme(),
      home: const DashBoardHome(),
    );
  }
}
