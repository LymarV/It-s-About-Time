import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:its_about_time/timeneyeService.dart';

class UserProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserProfilePageState();
  }
}

class _UserProfilePageState extends State<UserProfilePage> {
  final TimeneyeService timeneyeService = TimeneyeService();

  @override
  Widget build(BuildContext context) {
    timeneyeService.loadTimers();

    return CupertinoTabView(
      builder: (context) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Profile'),
          ),
          child: Container(
              padding: EdgeInsets.all(50),
              alignment: Alignment.center,
              color: Colors.teal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Profile'),
                  SizedBox(height: 100),
                  CupertinoTextField(
                    placeholder: 'API key',
                  ),
                ],
              )),
        );
      },
    );
  }
}
