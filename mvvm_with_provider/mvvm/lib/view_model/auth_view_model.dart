import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repository.dart';

// provider for authentication and screen navigation
class AuthViewModel extends ChangeNotifier {
  final _repo = AuthRepo();

  Future<void> loginUser(dynamic data, BuildContext context) async {
    _repo.login(data).then((value) {
      print(value.toString());
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
}
