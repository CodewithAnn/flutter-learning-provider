import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm/data/app_exception.dart';
import 'package:mvvm/data/network/baseApiServices.dart';
import 'package:http/http.dart ' as http;

class NetworkApiResponse extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJason;
    try {
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJason = responseReturn(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJason;
  }

  @override
  Future getPostApiResponse(  String url, dynamic data ) async{
    dynamic responseJason;
    try {
      Response response = await http.post(Uri.parse(url),body: data).timeout(Duration(seconds: 10));
      responseJason = responseReturn(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJason;
  }
  }

  // method getting the response from the server
  dynamic responseReturn(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorizeException(response.body.toString());
      case 500:
        return response.body.toString();
      default:
        throw FetchDataException(
            'Error accured during communicating with the server' +
                "with Status Code :" +
                response.statusCode.toString());
    }
  }

