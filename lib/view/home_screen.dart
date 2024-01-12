import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvvm_test_app/data/response/status.dart';
import 'package:mvvm_test_app/utils/Routes/routes_name.dart';
import 'package:mvvm_test_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  bool favouriteMovies = false;
  @override
  void initState() {
    // TODO: implement initState
    homeViewViewModel.fetchMoviesListApi();
    super.initState();
  }


  Future<void> saveFavouriteMovie(String title, String releaseDate, String imageUrl, String rating) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('$title-$releaseDate', jsonEncode({
      'title': title,
      'release_date': releaseDate,
      'image_url': imageUrl,
      'rating': rating,
    }));
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Home Screen"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Navigator.pushNamed(context, RoutesName.favourite);
          },
          child:

            const Icon(Icons.list, color: Colors.white),

        ),
        actions: [
          InkWell(
              onTap: () {
                userProvider.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: const Center(child: Text("Logout"))),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
          builder: (context, value, child) {
            switch (value.moviesList.status) {
              case Status.LOADING:
                return const CircularProgressIndicator();
              case Status.ERROR:
                return Center(child: Text(value.moviesList.message.toString()));
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: value.moviesList.data!.results!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        child: Card(
                          child: Center(
                            child: ListTile(
                              leading: Image.network(
                                value.moviesList.data!.results![index].poster_path!,
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
                              title: Text(value
                                  .moviesList.data!.results![index].title
                                  .toString()),
                              subtitle: Text(value
                                  .moviesList.data!.results![index].release_date
                                  .toString()),
                              trailing: Column(
                                mainAxisSize: MainAxisSize.min,

                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(value
                                          .moviesList.data!.results![index].vote_average
                                          .toString()),
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),

                                    ],
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                   InkWell(
                                     onTap: () async {
                                       await saveFavouriteMovie(
                                         value.moviesList.data!.results![index].title.toString(),
                                         value.moviesList.data!.results![index].release_date.toString(),
                                         value.moviesList.data!.results![index].poster_path.toString(),
                                         value.moviesList.data!.results![index].vote_average.toString(),
                                       );
                                       Navigator.pushNamed(context, RoutesName.favourite);
                                     },
                                       child:  Icon(favouriteMovies ? Icons.favorite :Icons.favorite_border_outlined,color: Colors.red,),
                                   ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
