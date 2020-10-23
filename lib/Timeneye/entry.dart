import 'package:its_about_time/Time/timeEntry.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

part 'entry.g.dart';

@JsonSerializable()
class Entry {
  Entry(this.id, this.entryDate, this.minutes, this.projectId, this.projectName,
      this.taskId, this.taskName, this.notes) {
    var date = DateTime.tryParse(entryDate);
    if (date != null) {
      _date = date;
    }

    var time = int.tryParse(minutes);
    if (time != null) {
      _time = time;
    }
  }

  String id;
  String entryDate;
  String minutes;
  String projectId;
  String projectName;
  String taskId;
  String taskName;
  String notes;

  DateTime _date;
  DateTime get date => _date;

  int _time;
  int get time => _time;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  Map<String, dynamic> toJson() => _$EntryToJson(this);
}
