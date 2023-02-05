import 'dart:convert';

import 'package:salaa_app/model/azkarmodel.dart';
import 'package:http/http.dart' as http;

class AzkarApi {
  static fetchAzkar() async {
    List<AzkarModel> model = [];
    var url = Uri.parse("http://www.hisnmuslim.com/api/ar/27.json");
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body)["content"];
    for (var i in responseBody) {
      model.add(AzkarModel( zekr: i["zekr"], repeat: i["repeat"]));
    }
    return model;
  }
}
