import 'dart:core';

import 'package:its_about_time/Time/timeEntry.dart';
import 'package:its_about_time/Timeneye/timeneyeService.dart';

class TimeService {
  static TimeService _instance;

  static TimeService getInstance() {
    if (_instance == null) {
      _instance = TimeService();
    }

    return _instance;
  }

  Future<List<TimeEntry>> loadTimeEntries() async {
    var result = List<TimeEntry>();
    var timeneyeService = TimeneyeService.getInstance();

    var timeneyeEntries = await timeneyeService.loadEntries();
    var timeneyeTimers = await timeneyeService.loadTimers();

    for (var e in timeneyeEntries) {
      var entry = TimeEntry(
          e.date, e.time, e.notes, e.projectName, TimeSource.Timeneye);
      result.add(entry);
    }

    for (var t in timeneyeTimers) {
      var entry = TimeEntry(
          t.date, t.time, t.notes, t.projectName, TimeSource.Timeneye);
      result.add(entry);
    }

    return result;
  }
}
