import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'timer.g.dart';

@JsonSerializable()
class Timer {
  Timer(this.id, this.minutes, this.projectId, this.projectName, this.taskId,
      this.taskName, this.notes) {
    date = DateTime.now();

    var time = int.tryParse(minutes);
    if (time != null) {
      _time = time;
    }
  }

  DateTime date;

  String id;
  String minutes;
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
