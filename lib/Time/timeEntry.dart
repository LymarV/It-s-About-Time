import 'dart:core';

enum TimeSource {
  Timeneye,
  Upwork,
}

class TimeEntry {
  TimeEntry(this.date, this.time, this.description, this.project, this.source);

  DateTime date;
  int time;
  String description;
  String project;

  TimeSource source;
}
