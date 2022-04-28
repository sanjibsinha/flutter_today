import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_today/view/beginner.dart';
import 'package:flutter_today/view/dart_home.dart';
import 'package:flutter_today/view/flutter_apps.dart';
import 'package:flutter_today/view/intermediate.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../model/happy_theme.dart';
import '../controller/dashboard_home.dart';

HappyTheme happyTheme = HappyTheme();

class FlutterToday extends StatelessWidget {
  const FlutterToday({Key? key}) : super(key: key);

  /// This widget is the root of your application.
  /// this is third branch, we will add bottom navigation bar\
  /// in the next branch

  @override
  Widget build(BuildContext context) {
    final controller = Completer<WebViewController>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Today',
      theme: happyTheme.buildTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashBoardHome(),
        Beginner.routeName: (context) => Beginner(
              webViewController: controller,
            ),
        Intermediate.routeName: (context) =>
            Intermediate(webViewController: controller),
        FlutterApps.routeName: (context) =>
            FlutterApps(webViewController: controller),
        DartHome.routeName: (context) =>
            DartHome(webViewController: controller),
      },
    );
  }
}
