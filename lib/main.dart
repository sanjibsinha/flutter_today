import 'package:flutter/material.dart';
import 'model/happy_theme.dart';
import 'view/flutter_today.dart';

void main() {
  HappyTheme happyTheme = HappyTheme();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Today',
      theme: happyTheme.buildTheme(),
      home: const FlutterToday(),
    ),
  );
}
