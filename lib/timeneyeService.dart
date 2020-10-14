import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:its_about_time/Timeneye/timer.dart';

import 'Timeneye/timers.dart';

import 'package:shared_preferences/shared_preferences.dart';

class TimeneyeService {
  String _apiKey = '';

  List<Timer> timers;

  TimeneyeService() {
    _loadApiKey();
  }

  void SetApiKey(String apiKey) async {
    _apiKey = apiKey;

    var prefs = await SharedPreferences.getInstance();

    await prefs.setString('apiKey', _apiKey);
  }

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

  void _loadApiKey() async {
    var prefs = await SharedPreferences.getInstance();

    _apiKey = prefs.getString('apiKey');
  }
}
