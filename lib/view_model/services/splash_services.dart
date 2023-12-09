import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_test_app/utils/Routes/routes_name.dart';
import 'package:mvvm_test_app/view_model/user_view_model.dart';

import '../../model/user_model.dart';

class SplashServices{
  Future<UserModel> getUserdata() => UserViewModel().getUser();

  void checkAuth (BuildContext context) async{
    getUserdata().then((value) async {
      print(value.token);
      if(value.token == 'null' || value.token =='') {
         await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context,RoutesName.login);
      }
      else{
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }

    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }

    });
  }
}