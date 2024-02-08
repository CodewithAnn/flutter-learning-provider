import 'package:api_call_provider/api/api_Services.dart';
import 'package:api_call_provider/models/dummy_api.dart';
import 'package:flutter/material.dart';

class ApiProvider with ChangeNotifier {
  late DummyApi model; // later we store data in this model when we get the data
  bool loading = true;

  getData() async {
    model = await ApiServices().getDummyApi();
    loading = false;
    notifyListeners();
  }
}
