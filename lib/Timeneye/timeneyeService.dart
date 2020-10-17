import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:its_about_time/Timeneye/entries.dart';
import 'package:its_about_time/Timeneye/entry.dart';
import 'package:its_about_time/Timeneye/timer.dart';

import 'timers.dart';

import 'package:shared_preferences/shared_preferences.dart';

class TimeneyeService {
  String _apiKey;

  List<Timer> timers;
  List<Entry> entries;

  static TimeneyeService _instance;

  static TimeneyeService getInstance() {
    if (_instance != null) {
      return _instance;
    }

    _instance = TimeneyeService();
    return _instance;
  }

  TimeneyeService() {
    getApiKey();
  }

  void SetApiKey(String apiKey) async {
    _apiKey = apiKey;

    var prefs = await SharedPreferences.getInstance();

    await prefs.setString('apiKey', _apiKey);
  }

  void loadTimers() async {
    if (_apiKey == null || _apiKey.isEmpty) {
      await getApiKey();
    }

    String dataURL = "https://track.timeneye.com/api/3/timers";
    http.Response response =
        await http.get(dataURL, headers: {'Bearer': _apiKey});

    print(response.body);
    var data = jsonDecode(response.body);

    var timersObject = Timers.fromJson(data);

    if (timersObject.timers == null || timersObject.timers.isEmpty) return;

    timers = timersObject.timers;
  }

  void loadEntries() async {
    if (_apiKey == null || _apiKey.isEmpty) {
      await getApiKey();
    }

    String dataURL = "https://track.timeneye.com/api/3/entries";
    http.Response response =
        await http.get(dataURL, headers: {'Bearer': _apiKey});

    var data = jsonDecode(response.body);

    var entriesObject = Entries.fromJson(data);

    if (entriesObject.entries == null || entriesObject.entries.isEmpty) return;

    entries = entriesObject.entries;
  }

  Future<String> getApiKey() async {
    var prefs = await SharedPreferences.getInstance();

    _apiKey = prefs.getString('apiKey');
    return _apiKey;
  }
}
