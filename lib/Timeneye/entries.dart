import 'dart:core';

import 'package:its_about_time/Timeneye/entry.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entries.g.dart';

@JsonSerializable()
class Entries {
  Entries(this.entries);

  List<Entry> entries;

  factory Entries.fromJson(Map<String, dynamic> json) =>
      _$EntriesFromJson(json);

  Map<String, dynamic> toJson() => _$EntriesToJson(this);
}
