import 'package:api_call_provider/Provider/api_provider.dart';
import 'package:api_call_provider/Provider/user_api_provider.dart';
import 'package:api_call_provider/screens/home_Screen.dart';
import 'package:api_call_provider/screens/second_Api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApiProvider()),
        ChangeNotifierProvider(create: (context) => UserApiProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SecondApi(),
      ),
    );
  }
}
