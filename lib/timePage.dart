import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class TimePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TimePageState();
  }
}

class _TimePageState extends State<TimePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Time'),
          ),
          child: Container(
              alignment: Alignment.center,
              color: CupertinoColors.activeOrange,
              child: Container(
                child: Text('Time'),
              )),
        );
      },
    );
  }
}
