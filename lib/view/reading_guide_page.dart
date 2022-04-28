import 'package:flutter/material.dart';

class ReadingGuidePage extends StatelessWidget {
  const ReadingGuidePage({Key? key}) : super(key: key);

  static const routeName = '/reading-guide';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is the Second Page home page',
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
