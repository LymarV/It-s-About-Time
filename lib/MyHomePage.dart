import 'package:flutter/cupertino.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.clock),
            label: 'Time',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile',
          )
        ],
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(
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
            break;
          case 1:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: Text('Profile'),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('Profile'),
                  ),
                );
              },
            );
            break;
        }

        return returnValue;
      },
    );
  }
}
