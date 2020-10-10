import 'package:flutter/cupertino.dart';

import 'myHomePage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'It`s About Time',
      home: MyHomePage(title: 'It`s About Time'),
    );
  }
}
