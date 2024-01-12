import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<dynamic> favouriteMovies = [];

  @override
  void initState() {
    super.initState();
    loadFavouriteMovies();
  }

  void loadFavouriteMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favouriteMovies = [];
    prefs.getKeys().forEach((key) {
      if (key.contains('-')) {
        favouriteMovies.add(jsonDecode(prefs.getString(key)!));
      }
    });
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Favourite Movies"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: // Inside the FavouriteScreen build method
      ListView.builder(
        itemCount: favouriteMovies.length,
        itemBuilder: (context, index) {
          final movie = favouriteMovies[index];
          return Container(
            height: 100,
            child: Card(
              child: Center(
                child: ListTile(
                  leading: Image.network(
                    movie['image_url'],
                    errorBuilder: (context, error, stack) {
                      return const Icon(
                        Icons.error,
                        color: Colors.red,
                      );
                    },
                    height: 70,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(movie['title'].toString()),
                  subtitle: Text(movie['release_date'].toString()),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(movie['rating'].toString()),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
