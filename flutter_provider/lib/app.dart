import 'package:flutter/material.dart';
import 'package:flutter_provider/Provider/counter_provider.dart';
import 'package:flutter_provider/Provider/slider_counter.dart';
import 'package:flutter_provider/Screens/FavouriteApp/favouriteApp.dart';
import 'package:flutter_provider/Screens/counter-App/counterApp.dart';
import 'package:flutter_provider/Screens/slider-counter/slider_counter.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SliderProvider(),
        ),
      ],
      child: MaterialApp(
        home: FavouriteApp(),
      ),
    );
  }
}
