import 'dart:convert';

import 'package:flutter_app/core/request/catalog_request_param.dart';
import 'package:flutter_app/core/service/response_parser.dart';
import 'package:flutter_app/models/index.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../constants.dart';

class CatalogServices {
  Future<List<Catalog>> getCatalog(CatalogRequestParam requestParam) async {
    print('requestParam : ${requestParam.toString()}.');
    Response response = await http.post(
      CATALOG_URL,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestParam.buildJson()),
    );

    print('requestParam : ${response.body}.');
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> maps = ResponseParser.parseToList(response);
      if (maps != null) {
        List<Catalog> out = List();
        maps.forEach((element) => out.add(Catalog.fromJson(element)));
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
