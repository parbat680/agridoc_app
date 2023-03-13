import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:agridoc/repository/handlers/error_handler.dart';
import 'package:dio/dio.dart';

class ApiBaseHelper {
  String url = "http://agridoc.ap-south-1.elasticbeanstalk.com";
  Future post(String endpoint, Map<dynamic, dynamic> data) async {
    var dio = Dio();
    var responseJson;

    try {
      var response = await dio.post(
        "$url/$endpoint",
        data: data,
        options: Options(headers: {
          'content-type': 'application/json',
        }),
      );
      log(response.toString());
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet Connection!");
    }

    return responseJson;
  }

  Future get(String endpoint, String query) async {
    var dio = Dio();
    var responseJson;
    print("$url/$endpoint/$query");
    try {
      var response = await dio.get(
        "$url/$endpoint/$query",
        options: Options(headers: {
          'content-type': 'application/json',
        }),
      );

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet Connection!");
    }

    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        throw BadRequestException("Something went wrong");
      case 401:
      case 403:
        throw UnauthorisedException("Session Expired, Login again");
      default:
        throw AppErrors(
            message: "Something went wrong", error: "unknown error");
    }
  }
}
