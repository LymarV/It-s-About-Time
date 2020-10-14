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
  final TimeneyeService timeneyeService = TimeneyeService.getInstance();
  final apiKeyTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _loadApiKey();

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
                    controller: apiKeyTextController,
                    placeholder: 'API key',
                  ),
                  CupertinoButton(child: Text('Save'), onPressed: _saveApiKey),
                ],
              )),
        );
      },
    );
  }

  void _saveApiKey() {
    timeneyeService.SetApiKey(apiKeyTextController.text);
  }

  void _loadApiKey() async {
    var apiKey = await timeneyeService.getApiKey();

    apiKeyTextController.text = apiKey;
  }
}
