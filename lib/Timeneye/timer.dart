import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'timer.g.dart';

@JsonSerializable()
class Timer {
  Timer(this.id, this.projectId, this.projectName, this.taskId, this.taskName,
      this.notes);

  String id;
  String projectId;
  String projectName;
  String taskId;
  String taskName;
  String notes;

  factory Timer.fromJson(Map<String, dynamic> json) => _$TimerFromJson(json);

  Map<String, dynamic> toJson() => _$TimerToJson(this);
}
