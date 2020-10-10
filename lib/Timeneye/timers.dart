import 'dart:core';

import 'package:its_about_time/Timeneye/timer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timers.g.dart';

@JsonSerializable()
class Timers {
  Timers(this.timers);

  List<Timer> timers;

  factory Timers.fromJson(Map<String, dynamic> json) => _$TimersFromJson(json);

  Map<String, dynamic> toJson() => _$TimersToJson(this);
}
