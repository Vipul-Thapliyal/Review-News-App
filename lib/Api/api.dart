import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_app/Constants/api_Key.dart';
import 'package:news_app/Constants/app_Url.dart';


class Api {
  Future<dynamic> get({required String endPoint}) async {
    const int TIME_OUT_DURATION = 100;

    var link = "${AppUrl.appUrl}" + "${endPoint}";

    var url = Uri.parse("$link");

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
