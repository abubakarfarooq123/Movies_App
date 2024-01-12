import 'package:flutter/cupertino.dart';
import 'package:mvvm_test_app/data/response/api_response.dart';
import 'package:mvvm_test_app/model/movies_model.dart';
import 'package:mvvm_test_app/repository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  ApiResponse<MoviesModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesModel> response){
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    _myRepo.fetchMoviesListApi().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
