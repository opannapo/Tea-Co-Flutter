import 'dart:convert';

import 'package:http/http.dart';

class ResponseParser {
  static List<Map<String, dynamic>> parseToList(Response response) {
    Map jsonBody = json.decode(response.body);

    if (jsonBody.containsKey("data") && jsonBody['data'].containsKey("items")) {
      List<Map<String, dynamic>> jsonResponse = List();
      json.decode(response.body)['data']['items'] as List
        ..forEach((element) {
          jsonResponse.add(element);
        });
      return jsonResponse;
    } else {
      return null;
    }
  }

  static Map<String, dynamic> parse(Response response) {
    Map jsonResponse = json.decode(response.body);
    print("ResponseParser $jsonResponse");
    return jsonResponse;
  }
}
