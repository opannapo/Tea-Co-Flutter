import 'dart:convert';

import 'package:flutter_app/core/request/outlet_request_param.dart';
import 'package:flutter_app/core/service/response_parser.dart';
import 'package:flutter_app/models/index.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../constants.dart';

class OutletServices {
  Future<List<Outlets>> getOutlets(OutletRequestParam requestParam) async {
    Response response = await http.post(
      OUTLETS_URL,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestParam.buildJson()),
    );

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> maps = ResponseParser.parseToList(response);
      if (maps != null) {
        List<Outlets> out = List();
        maps.forEach((element) => out.add(Outlets.fromJson(element)));
        return out;
      } else {
        return null;
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }
}
