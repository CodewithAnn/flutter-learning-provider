import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

// provider for authentication and screen navigation
class AuthViewModel extends ChangeNotifier {
  final _repo = AuthRepo();
  bool _loading = false;
  bool get loading => _loading;

  bool _signupLoding = false;
  bool get signupLoding => _signupLoding;

  setsignUpLoading(bool value) {
    _signupLoding = value;
    notifyListeners();
  }

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginUser(dynamic data, BuildContext context) async {
    setLoading(true);
    _repo.login(data).then((value) {
      setLoading(false);
      Navigator.pushNamed(context, RoutesName.dashboard);
      Utils.flushBarErrorMessage("Login Successful", context);
      print(value.toString());
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

  Future<void> signUpUser(dynamic data, BuildContext context) async {
    setsignUpLoading(true);
    _repo.signUp(data).then((value) {
      setsignUpLoading(false);
      // navigate to the home page after successful registration
      Navigator.pushNamed(context, RoutesName.dashboard);
      // after registration show this massage.
      Utils.flushBarErrorMessage("Sign Up Successful", context);
      // notifyListeners();
      print(value.toString());
    }).onError((error, stackTrace) {
      print(error.toString());

      print("Error");
    });
  }
}
