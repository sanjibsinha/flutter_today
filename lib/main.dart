import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/element_at.dart';
import 'model/global_green_scheme.dart';
import 'view/flutter_today.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ElementAt>(
          create: (cntext) => ElementAt(),
        ),
        Provider<GlobalGreenScheme>(
          create: (context) => GlobalGreenScheme(),
        ),
      ],
      child: const FlutterToday(),
    ),
  );
}
