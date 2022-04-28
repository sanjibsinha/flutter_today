import 'package:flutter/material.dart';

class FlutterStatePage extends StatelessWidget {
  const FlutterStatePage({Key? key}) : super(key: key);
  static const routeName = '/flutter-state';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is the FlutterState Page home page',
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
