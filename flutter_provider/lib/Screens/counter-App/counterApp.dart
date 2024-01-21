import 'package:flutter/material.dart';
import 'package:flutter_provider/Provider/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, value, child) {
            return Text(
              value.count.toString(),
              style: TextStyle(fontSize: 50),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
