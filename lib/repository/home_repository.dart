
import 'package:mvvm_test_app/model/movies_model.dart';

import '../data/network/baseApiServices.dart';
import '../data/network/networkApiServices.dart';
import '../res/app_url.dart';

class HomeRepository {

  final BaseApiServices _apiServices = NetworkApiService();

  Future<MoviesModel> fetchMoviesListApi() async{

    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.moviesBaseUrl);

      return response = MoviesModel.fromJson(response);

    }catch(e){
      rethrow ;
    }

  }

}