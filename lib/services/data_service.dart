import 'package:http/http.dart' as http;

class DataService{
  String baseUrI = "http://mark.bslmeiyu.com/api";
  getInfo() async {
    var apiUrl = '/getplaces';
    http.Response res = await http.get(Uri.parse(baseUrI+apiUrl));
    try{
      
    }
    catch(e){

    }
  }
}