import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FavouriteAppProvider with ChangeNotifier {
  // initial list
  List<int> _favourites = [];
  List<int> get favourite => _favourites;

  // method to add likes in list
  void getFavourites(int value) {
    _favourites.add(value);
    notifyListeners();
  }

  // to remove from list
  void unlike(int value) {
    _favourites.remove(value);
    notifyListeners();
  }
}
