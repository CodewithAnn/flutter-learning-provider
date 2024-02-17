import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/Dashboard_Screen.dart';
import 'package:mvvm/view/login_Screen.dart';

class Routes {
  static Route<dynamic> genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.dashboard:
        return MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        );
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("404"),
            ),
          ),
        );
    }
  }
}
