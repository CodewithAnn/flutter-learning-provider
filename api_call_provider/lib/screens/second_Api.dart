import 'package:api_call_provider/Provider/user_api_provider.dart';
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

    Provider.of<UserApiProvider>(context, listen: false).userData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserApiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: Text("Api Call"),
      ),
      body: provider.loading
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: provider.model[''].toString().length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(provider.model['image'].toString()),
                      ),
                      title: Text(provider.model['firstName'].toString()),
                      trailing: Text(provider.model['phone'].toString()),
                    );
                  },
                ))
              ],
            ),
    );
  }
}
