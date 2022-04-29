import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_today/view/beginner.dart';
import 'package:flutter_today/view/dart_home.dart';
import 'package:flutter_today/view/flutter_apps.dart';
import 'package:flutter_today/view/intermediate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../view/first_page.dart';
import '../view/home_page.dart';
import '../view/second_page.dart';
import '../view/third_page.dart';

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

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FirstPage(),
    SecondPage(),
    ThirdPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Tab> topTabs = <Tab>[
    Tab(
      iconMargin: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        'HOME',
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
    Tab(
      child: Text(
        'BEGINNERS',
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
    Tab(
      child: Text(
        'INTERMEDIATE',
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
    Tab(
      child: Text(
        'FLUTTER APPS',
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
    Tab(
      child: Text(
        'DART',
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
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
              'Flutter Today',
              textAlign: TextAlign.center,
              style: GoogleFonts.laila(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            centerTitle: true,

            //backgroundColor: Colors.grey[400],
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.pink,
                    Colors.grey,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            elevation: 20,
            titleSpacing: 60,
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.red,
              indicatorWeight: 10,
              controller: _tabController,
              tabs: topTabs,
            ),
          ),
          body: Column(
            children: [
              TabBarView(
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
              _widgetOptions.elementAt(_selectedIndex),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
