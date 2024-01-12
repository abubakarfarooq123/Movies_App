import 'package:mvvm_test_app/data/network/baseApiServices.dart';
import 'package:mvvm_test_app/data/network/networkApiServices.dart';
import 'package:mvvm_test_app/res/app_url.dart';

class AuthRepository{

  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async{

    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);

      return response;

    }catch(e){
      rethrow ;
    }

  }


  Future<dynamic> registerApi(dynamic data) async{

    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      return response;

    }catch(e){
      rethrow;
    }

  }

}






// 341e4074d7e960751edc9c495df6b5ba