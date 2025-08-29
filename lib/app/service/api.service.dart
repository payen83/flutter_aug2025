import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

final ApiService api = ApiService();

class ApiService {
  String baseURL = 'https://dummyjson.com';

  Future<dynamic> getHttp(String path) async{
    var url = Uri.parse(baseURL+path);

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    var response = await http.post(url, headers: headers);
    if(response.statusCode == 200){
      var jsonResponse = json.encode(response);
      return jsonResponse;
    } else {
      log("Error in getting API");
    }
  }
}