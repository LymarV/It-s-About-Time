import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:its_about_time/Timeneye/timeneyeService.dart';

import 'package:oauth1/oauth1.dart' as oauth1;

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
  void initState() {
    super.initState();

    _upworkOauth();
  }

  @override
  Widget build(BuildContext context) {
    _loadApiKey();

    return CupertinoTabView(
      builder: (context) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Profile'),
          ),
          child: _getMainContainer(),
        );
      },
    );
  }

  // HACK! to enable hot reload inside the CupertiroTabView
  Widget _getMainContainer() {
    return Container(
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
        ));
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

  void _upworkOauth() async {
    // define platform (server)
    var platform = new oauth1.Platform(
        'https://www.upwork.com/api/auth/v1/oauth/token/request', // temporary credentials request
        'https://www.upwork.com/services/api/auth', // resource owner authorization
        'https://www.upwork.com/api/auth/v1/oauth/token/request', // token credentials request
        oauth1.SignatureMethods.hmacSha1 // signature method
        );

    // define client credentials (consumer keys)
    const String apiKey = '';
    const String apiSecret = '';
    var clientCredentials = new oauth1.ClientCredentials(apiKey, apiSecret);

    // create Authorization object with client credentials and platform definition
    var auth = new oauth1.Authorization(clientCredentials, platform);

    // request temporary credentials (request tokens)
    var res = await auth.requestTemporaryCredentials();

    // redirect to authorization page
    var url = auth.getResourceOwnerAuthorizationURI(res.credentials.token);
    print("Open with your browser: $url");

    // request token credentials (access tokens)
    // return auth.requestTokenCredentials(res.credentials, verifier);

    //   // yeah, you got token credentials
    //   // create Client object
    //   var client = new oauth1.Client(
    //       platform.signatureMethod, clientCredentials, res.credentials);

    //   // now you can access to protected resources via client
    //   client.get('https://www.upwork.com/api/auth/v1/info.json').then((res) {
    //     print(res.body);
    //   });

    //   // NOTE: you can get optional values from AuthorizationResponse object
    //   print("Res: " + res.toString());
    // });
  }
}
