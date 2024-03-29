import 'dart:convert';

import 'package:api_call_provider/models/dummy_api.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<DummyApi> getDummyApi() async {
    final uri = Uri.parse("https://reqres.in/api/users?page=2");
    final response = await http.get(uri);
    late DummyApi data;

    if (response.statusCode == 200 || response.statusCode == 201) {
      data = DummyApi.fromJson(jsonDecode(response.body));
    } else {
      print(
        "Http error on getting dummy api, status code: ${response.statusCode}",
      );
    }
    return data;
  }

  Future<dynamic> getUserData() async {
    final uri = Uri.parse("https://dummyjson.com/users/1");
    final getResponse = await http.get(uri);

    late dynamic userData;

    if (getResponse.statusCode == 200) {
      userData = jsonDecode(getResponse.body);
    } else {
      throw Exception('failed to get user data, status code: ${getResponse
      .statusCode}');
    }
    return userData;
  }
}
