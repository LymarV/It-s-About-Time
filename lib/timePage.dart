import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:its_about_time/Time/timeEntry.dart';
import 'package:its_about_time/Time/timeService.dart';

class TimePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TimePageState();
  }
}

class _TimePageState extends State<TimePage> {
  final TimeService timeService = TimeService.getInstance();

  List<TimeEntry> entries = List.empty();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _loadEntries();

    return CupertinoTabView(
      builder: (context) {
        return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Time'),
            ),
            child: Container(
                alignment: Alignment.center,
                color: CupertinoColors.activeOrange,
                child: ListView.builder(
                  itemCount: entries.length,
                  itemBuilder: (context, position) {
                    return Text(entries[position].description);
                  },
                )));
      },
    );
  }

  _loadEntries() async {
    var list = await timeService.loadTimeEntries();
    setState(() {
      entries = list;
    });
  }
}
