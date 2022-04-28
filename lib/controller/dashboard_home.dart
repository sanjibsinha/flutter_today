import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../model/element_at.dart';
import '../view/why_flutter_page.dart';
import '../view/home_page.dart';
import '../view/beginner.dart';
import '../view/dart_home.dart';
import '../view/flutter_apps.dart';
import '../view/intermediate.dart';
import '../view/reading_guide_page.dart';
import '../view/flutter_state_page.dart';

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

  static const List<Widget> _widgetOptions = <Widget>[
    WhyFlutterPage(),
    ReadingGuidePage(),
    FlutterStatePage(),
  ];

  final List<Tab> topTabs = <Tab>[
    const Tab(child: Text('HOME')),
    const Tab(child: Text('BEGINNERS')),
    const Tab(child: Text('INTERMEDIATE')),
    const Tab(child: Text('FLUTTER APPS')),
    const Tab(child: Text('DART')),
    const Tab(child: Text('OTHER PAGES')),
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
              style: Theme.of(context).appBarTheme.titleTextStyle,
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
              _widgetOptions.elementAt(context.watch<ElementAt>().count),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            /// customizing background color
            ///
            backgroundColor: Theme.of(context).bottomAppBarColor,
            mouseCursor: SystemMouseCursors.grab,
            unselectedItemColor: Colors.deepOrangeAccent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.shifting,
            selectedFontSize: 20,
            selectedIconTheme: const IconThemeData(
              color: Colors.amberAccent,
            ),

            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.favorite_border_outlined,
                ),
                label: 'First Page',
                backgroundColor: Colors.green[200],
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.place_outlined,
                ),
                label: 'Second Page',
                backgroundColor: Colors.green[400],
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.hotel_outlined),
                label: 'Third Page',
                backgroundColor: Colors.green[700],
              ),
            ],
            selectedItemColor: Colors.green[800],
            currentIndex: context.watch<ElementAt>().count,
            iconSize: 50,
            onTap: context.read<ElementAt>().onItemTapped,
            elevation: 5,
          ),
        ),
      ),
    );
  }
}
