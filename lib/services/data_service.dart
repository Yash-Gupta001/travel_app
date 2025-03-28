import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_app/model/data_model.dart';

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";
  Future<List<DataModel>>getInfo() async {
    var apiUrl = '/getplaces';
    //creating a get request
    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));

    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        print("At data sercies");
        print(list.map((e) => DataModel.fromJson(e)).toList());
        return list
            .map((e) => DataModel.fromJson(e))
            .toList(); // converting the JSON from the server to the JSON format that the flutter understands
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
