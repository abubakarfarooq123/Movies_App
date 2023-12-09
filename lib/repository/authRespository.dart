import 'package:mvvm_test_app/data/network/baseApiServices.dart';
import 'package:mvvm_test_app/data/network/networkApiServices.dart';
import 'package:mvvm_test_app/res/app_url.dart';

class AuthRepository{

  BaseApiServices _apiServices = NetwrokApiService();

  Future<dynamic> loginApi(dynamic data) async{

    try{
      dynamic response = await _apiServices.getPostApiRespone(AppUrl.loginEndPoint, data);

      return response;

    }catch(e){
      throw e ;
    }

  }


  Future<dynamic> registerApi(dynamic data) async{

    try{
      dynamic response = await _apiServices.getPostApiRespone(AppUrl.registerEndPoint, data);
      return response;

    }catch(e){
      throw e;
    }

  }

}