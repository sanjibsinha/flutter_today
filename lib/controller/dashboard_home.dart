import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_today/view/beginner.dart';
import 'package:flutter_today/view/dart_home.dart';
import 'package:flutter_today/view/flutter_apps.dart';
import 'package:flutter_today/view/intermediate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../view/home_page.dart';

import 'dashboard_drawer.dart';

class DashBoardHome extends StatefulWidget {
  const DashBoardHome({
    Key? key,
  }) : super(key: key);

  @override
  State<DashBoardHome> createState() => _DashBoardHomeState();
}

class _DashBoardHomeState extends State<DashBoardHome>
    with SingleTickerProviderStateMixin {
  final controller = Completer<WebViewController>();
  TabController? _tabController;

  final List<Tab> topTabs = <Tab>[
    const Tab(child: Text('HOME')),
    const Tab(child: Text('BEGINNERS')),
    const Tab(child: Text('INTERMEDIATE')),
    const Tab(child: Text('FLUTTER APPS')),
    const Tab(child: Text('DART')),
  ];

  @override
  void initState() {
    _tabController =
        TabController(length: topTabs.length, initialIndex: 0, vsync: this)
          ..addListener(() {
            setState(() {});
          });

    super.initState();
  }

  Future<bool> _onWillPop() async {
    if (_tabController?.index == 0) {
      await SystemNavigator.pop();
    }

    Future.delayed(const Duration(microseconds: 100), () {
      _tabController?.index = 0;
    });

    return _tabController?.index == 0;
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(
              'FlutterToday',
              style: GoogleFonts.laila(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.black,
              tabs: topTabs,
              isScrollable: true,
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              /// all categories displayed on tabs
              ///
              HomePage(webViewController: controller),
              Beginner(webViewController: controller),
              Intermediate(webViewController: controller),
              FlutterApps(webViewController: controller),
              DartHome(webViewController: controller),
            ],
          ),
        ),
      ),
    );
  }
}
