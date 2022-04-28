import 'dart:async';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../model/global_green_scheme.dart';
//import '../model/happy_theme.dart';
import '../controller/dashboard_home.dart';
import 'beginner.dart';
import 'dart_home.dart';
import 'flutter_apps.dart';
import 'intermediate.dart';
import 'flutter_state_page.dart';
import 'reading_guide_page.dart';
import 'why_flutter_page.dart';

class FlutterToday extends StatelessWidget {
  const FlutterToday({Key? key}) : super(key: key);

  /// This widget is the root of your application.
  /// this is third branch, we will add bottom navigation bar\
  /// in the next branch

  @override
  Widget build(BuildContext context) {
    final controller = Completer<WebViewController>();
    final ThemeData globalTheme =
        Provider.of<GlobalGreenScheme>(context).globalTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Today',
      theme: globalTheme,
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
        WhyFlutterPage.routeName: (context) => const WhyFlutterPage(),
        ReadingGuidePage.routeName: (context) => const ReadingGuidePage(),
        FlutterStatePage.routeName: (context) => const FlutterStatePage(),
      },
    );
  }
}
