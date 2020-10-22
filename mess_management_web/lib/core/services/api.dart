import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'exceptions.dart';

class Api {
  static const URL = 'https://asia-east2-tortoise-89870.cloudfunctions.net/';

  var client = http.Client();

  Future<dynamic> get(String endpoint) async {
    var responseJson;
    try {
      print(URL + endpoint);
      final response = await http.get(URL + endpoint);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String endpoint, String body) async {
    var responseJson;
    try {
      http.Response response = await http.post(
        URL + endpoint,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );
      responseJson = await _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      case 500:
      default:
        print(json.decode(response.body.toString()));
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
