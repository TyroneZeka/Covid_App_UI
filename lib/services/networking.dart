import 'package:http/http.dart' as http;
import 'dart:convert';

class DataHandler {
  DataHandler({this.url});
  final String url;
  //https://disease.sh/v3/covid-19/countries/Zimbabwe?yesterday=true&strict=false
  //COvidActNow api_key = b7d41b718ebd40ab8e114f8df863b912

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
