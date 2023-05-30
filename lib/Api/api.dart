import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Api {
  Future<dynamic> get({required String endPoint}) async {
    const int TIME_OUT_DURATION = 100;

    var url = Uri.parse("$endPoint");

    try {
      final response = await http.get(url, headers: {
        "Content-Type": "application/json",
      }).timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw ('No Internet Connection');
    } on TimeoutException {
      throw ('API not responded in time');
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final decoderesponse = json.decode(response.body) as Map<String, dynamic>;
        return decoderesponse;
      case 201:
        final responsejson = json.decode(response.body) as Map<String, dynamic>;
        return responsejson;
      case 500:
        final decoderesponse = json.decode(response.body) as Map<String, dynamic>;
        return decoderesponse;
    }
  }
}
