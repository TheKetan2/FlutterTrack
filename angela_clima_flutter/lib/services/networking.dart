import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    http.Response responce = await http.get(url);
    if (responce.statusCode == 200) {
      String data = responce.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(responce.statusCode);
    }
  }
}
