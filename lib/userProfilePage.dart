import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:its_about_time/Timeneye/timeneyeService.dart';

class UserProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserProfilePageState();
  }
}

class _UserProfilePageState extends State<UserProfilePage> {
  final TimeneyeService timeneyeService = TimeneyeService.getInstance();
  final apiKeyTextController = TextEditingController();

  bool timeneyeApiKeyFieldVisible = false;

  IconData timeneyeKeyVisibilityIcon = CupertinoIcons.eye_slash;

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 100),
                  Row(
                    children: [
                      Text(
                        'Timeneye API Key',
                        style: TextStyle(
                          color: Color(0xff455272),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: CupertinoTextField(
                          obscureText: !timeneyeApiKeyFieldVisible,
                          controller: apiKeyTextController,
                          placeholder: 'API key',
                        ),
                      ),
                      CupertinoButton(
                          child: Icon(
                            timeneyeKeyVisibilityIcon,
                            color: Color(0xff455272),
                          ),
                          onPressed: _toggleTimeneyeKeyVisibility),
                    ],
                  ),
                  SizedBox(height: 100),
                  CupertinoButton.filled(
                    child: Text('Save'),
                    onPressed: _saveApiKey,
                  ),
                ],
              )),
        );
      },
    );
  }

  void _saveApiKey() {
    timeneyeService.setApiKey(apiKeyTextController.text);
  }

  void _loadApiKey() async {
    var apiKey = await timeneyeService.getApiKey();

    apiKeyTextController.text = apiKey;
  }

  void _toggleTimeneyeKeyVisibility() {
    setState(() {
      timeneyeApiKeyFieldVisible = !timeneyeApiKeyFieldVisible;

      timeneyeKeyVisibilityIcon = timeneyeApiKeyFieldVisible
          ? CupertinoIcons.eye
          : CupertinoIcons.eye_slash;
    });
  }
}
