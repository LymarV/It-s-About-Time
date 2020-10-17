import 'package:json_annotation/json_annotation.dart';
import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

part 'entry.g.dart';

@JsonSerializable()
class Entry {
  Entry(this.id, this.projectId, this.projectName, this.taskId, this.taskName,
      this.notes);

  String id;
  String projectId;
  String projectName;
  String taskId;
  String taskName;
  String notes;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  Map<String, dynamic> toJson() => _$EntryToJson(this);
}
