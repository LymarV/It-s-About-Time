import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

    _loadEntries();
  }

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
                child: ListView.builder(
                  itemCount: entries.length,
                  itemBuilder: (context, position) {
                    return _getRow(position);
                  },
                )));
      },
    );
  }

  Widget _getRow(int i) {
    var e = entries[i];

    final hours = e.time ~/ 60;
    final minutes = e.time % 60;

    return Padding(
      padding: const EdgeInsets.only(bottom: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: e.source == TimeSource.Timeneye
                    ? Color(0xff455272)
                    : Color(0xff5bbc2e)),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 40)),
          ),
          Column(
            children: [
              Text(e.project),
              Text(
                e.description,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.blueGrey),
              ),
            ],
          ),
          Text('$hours:$minutes'),
        ],
      ),
    );
  }

  _loadEntries() async {
    var list = await timeService.loadTimeEntries();
    list.sort((e1, e2) => e1.date.compareTo(e2.date));

    setState(() {
      entries = list;
    });
  }
}
