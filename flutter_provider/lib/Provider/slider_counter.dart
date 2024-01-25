import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier {
  double _value = 0;
  double get valueDouble => _value;

  void getIncreseValue(double num) {
    _value = num;
    notifyListeners();
  }

  void decreseValue() {
    _value--;
    notifyListeners();
  }
}
