import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
