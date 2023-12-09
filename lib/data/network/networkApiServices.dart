import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvm_test_app/data/app_exception.dart';
import 'package:mvvm_test_app/data/network/baseApiServices.dart';

class NetwrokApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));

      responseJson = retunrResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiRespone(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response =
          await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));

      responseJson = retunrResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }
}

dynamic retunrResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = jsonDecode(response.body);

      return responseJson;
    case 400:
      throw BadRequestExpection(response.body.toString());
    case 404:
      throw BadRequestExpection(response.body.toString());

    default:
      throw FetchDataException('Error Occured While Communicating with server' +
          'with Status Code' +
          response.statusCode.toString());
  }
}
