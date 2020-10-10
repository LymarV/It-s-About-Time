import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:its_about_time/Timeneye/timer.dart';

import 'Timeneye/timers.dart';

class TimeneyeService {
  String _apiKey = '';

  List<Timer> timers;

  void loadTimers() async {
    String dataURL = "https://track.timeneye.com/api/3/timers";
    http.Response response =
        await http.get(dataURL, headers: {'Bearer': _apiKey});

    print(response.body);
    var data = jsonDecode(response.body);

    var timersObject = Timers.fromJson(data);

    if (timersObject.timers.isEmpty) return;

    timers = timersObject.timers;
  }
}
