import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigationController extends StatelessWidget {
  const NavigationController({required this.navigationController, Key? key})
      : super(key: key);

  final Completer<WebViewController> navigationController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: navigationController.future,
      builder: (context, snapshot) {
        final WebViewController? navigationController = snapshot.data;
        if (snapshot.connectionState != ConnectionState.done ||
            navigationController == null) {
          return Row(
            children: const <Widget>[
              Icon(Icons.arrow_back_ios),
              Icon(Icons.arrow_forward_ios),
              Icon(Icons.replay),
            ],
          );
        }

        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () async {
                if (await navigationController.canGoBack()) {
                  await navigationController.goBack();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No back history item')),
                  );
                  return;
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () async {
                if (await navigationController.canGoForward()) {
                  await navigationController.goForward();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No forward history item')),
                  );
                  return;
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: () {
                navigationController.reload();
              },
            ),
          ],
        );
      },
    );
  }
}
