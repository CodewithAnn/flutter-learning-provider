import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondApi extends StatefulWidget {
  const SecondApi({super.key});

  @override
  State<SecondApi> createState() => _SecondApiState();
}

class _SecondApiState extends State<SecondApi> {
  @override
  void initState() {
    // TODO: implement initState
    
    Provider.of<>(context, listen: false).();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: Text("Api Call"),
      ),
    );
  }
}
