import 'package:api_call_provider/Provider/api_provider.dart';
import 'package:api_call_provider/api/api_Services.dart';
import 'package:flutter/material.dart';

class UserApiProvider with ChangeNotifier {
  late dynamic model;
  bool loading = true;

  userData() async {
    model = await ApiServices().getUserData();
    loading = false;

    notifyListeners();
  }
}
