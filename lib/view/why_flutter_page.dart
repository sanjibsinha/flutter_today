import 'package:flutter/material.dart';

class WhyFlutterPage extends StatelessWidget {
  const WhyFlutterPage({Key? key}) : super(key: key);

  static const routeName = '/why-flutter';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is the WhyFlutter Page home page',
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
