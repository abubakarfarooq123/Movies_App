

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_test_app/model/user_model.dart';
import 'package:mvvm_test_app/repository/authRespository.dart';
import 'package:mvvm_test_app/utils/Routes/routes_name.dart';
import 'package:mvvm_test_app/utils/utils.dart';
import 'package:mvvm_test_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();

  bool _loading = false;

  bool get loading => _loading;

  void isLoading(bool val){
    _loading = val;
    notifyListeners();
  }


  bool _signUploading = false;

  bool get signUploading => _signUploading;

  void isSignUpLoading(bool val){
    _signUploading = val;
    notifyListeners();
  }


  Future<void> loginApi(dynamic data, BuildContext context) async {
    isLoading(true);
    _myRepo.loginApi(data).then((value){
      isLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(
          UserModel(
        token: value['token'].toString()
      )
      );
      Utils.flashbar(context, 'Successfully Login');
      if (kDebugMode) {
        print(value.toString());
      }
      isLoading(false);
      Navigator.pushNamed(context, RoutesName.home);

    }).onError((error, stackTrace){
      isLoading(false);
      Utils.flashbar(context, error.toString());
      if (kDebugMode) {
        print(error.toString());
      }

    });
    
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    isSignUpLoading(true);
    _myRepo.registerApi(data).then((value){
      Utils.flashbar(context, 'Successfully SignUp');
      if (kDebugMode) {
        print(value.toString());
      }
      isSignUpLoading(false);
      Navigator.pushNamed(context, RoutesName.home);

    }).onError((error, stackTrace){
      isSignUpLoading(false);
      Utils.flashbar(context, error.toString());
      if (kDebugMode) {
        print(error.toString());
      }

    });

  }
}