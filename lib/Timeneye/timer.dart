import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'timer.g.dart';

@JsonSerializable()
class Timer {
  Timer(this.id, this.currentSeconds, this.projectId, this.projectName,
      this.taskId, this.taskName, this.notes) {
    _date = DateTime.now();

    _time = currentSeconds ~/ 60;
  }

  DateTime _date;
  DateTime get date => _date;

  int currentSeconds;

  String id;
  String projectId;
  String projectName;
  String taskId;
  String taskName;
  String notes;

  int _time;
  int get time => _time;

  factory Timer.fromJson(Map<String, dynamic> json) => _$TimerFromJson(json);

  Map<String, dynamic> toJson() => _$TimerToJson(this);
}
