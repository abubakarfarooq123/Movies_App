import 'dart:convert';
import 'package:http/http.dart';

class MoviesModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  MoviesModel({this.page, this.results, this.totalPages, this.totalResults});

  MoviesModel.fromJson(Map<String, dynamic> parsedJson) {
    page = parsedJson['page'];
    totalResults = parsedJson['total_results'];
    totalPages = parsedJson['total_pages'];
    List<Results> temp = [];
    var parsedResults = parsedJson['results'] as List;
    for (var i = 0; i < parsedResults.length; i++) {
      Results results = Results(parsedResults[i]);
      temp.add(results);
    }
    results = temp;
  }
}

class Results {
  late String vote_count;
  late int id;
  late bool video;
  late String? vote_average;
  late String title;
  late double popularity;
  late String poster_path;
  late List<int> genre_ids = [];
  late String backdrop_path;
  late bool adult;
  late String overview;
  late String release_date;

  Results(results) {
    vote_count = results['vote_count'].toString();
    id = results['id'];
    video = results['video'];

    vote_average = results['vote_average'].toString();
    title = results['title'].toString();
    popularity = results['popularity'];
    poster_path = 'https://image.tmdb.org/t/p/original/'+results['poster_path'];

    for (var i = 0; i < results['genre_ids'].length; i++) {
      genre_ids.add(results['genre_ids'][i]);
    }
    backdrop_path = results['backdrop_path'].toString();
    adult = results['adult'];
    overview = results['overview'].toString();
    release_date = results['release_date'].toString();
  }
}
