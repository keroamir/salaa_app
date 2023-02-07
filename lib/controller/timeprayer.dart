import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:salaa_app/model/timeprayermodel.dart';

class TimePrayer {
  static getTimePrayer() async {
    var now = DateTime.now();
    var today = "${now.day}-${now.month}-${now.year}";
    var time = Uri.parse(
        "https://muslimsalat.com/cairo/daily/$today.json?key=e1240af194bf8f09dd87ad9216934773");
    var response = await http.get(time);
    var responseBody = jsonDecode(response.body)["items"][0];
    TimePrayerModel model = TimePrayerModel(
        date_for: responseBody["date_for"],
        fajr: responseBody["fajr"],
        shurooq: responseBody["shurooq"],
        dhuhr: responseBody["dhuhr"],
        asr: responseBody["asr"],
        maghrib: responseBody["maghrib"],
        isha: responseBody["isha"]);
    return model;
  }
}
