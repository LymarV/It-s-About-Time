import 'package:flutter/cupertino.dart';
import 'package:its_about_time/timePage.dart';
import 'package:its_about_time/userProfilePage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

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
        Widget returnValue;
        switch (index) {
          case 0:
            returnValue = TimePage();
            break;
          case 1:
            returnValue = UserProfilePage();
            break;
        }

        return returnValue;
      },
    );
  }
}
