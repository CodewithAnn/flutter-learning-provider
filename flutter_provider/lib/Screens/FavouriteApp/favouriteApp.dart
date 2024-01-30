import 'package:flutter/material.dart';
import 'package:flutter_provider/Provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavouriteApp extends StatefulWidget {
  const FavouriteApp({super.key});

  @override
  State<FavouriteApp> createState() => _FavouriteAppState();
}

class _FavouriteAppState extends State<FavouriteApp> {
  List<int> _list = [];
  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite App "),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Consumer<FavouriteAppProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.favourite.contains(index)) {
                          // remove from favourites list
                          value.unlike(index);
                        } else {
                          value.getFavourites(index);
                        }
                      },
                      title: Text(
                        'item' + index.toString(),
                      ),
                      trailing: Icon(value.favourite.contains(index)
                          ? Icons.favorite_rounded
                          : Icons.favorite_border),
                    );
                  },
                  //child: //
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
