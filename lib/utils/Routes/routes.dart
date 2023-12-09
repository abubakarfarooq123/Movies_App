import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_test_app/utils/Routes/routes_name.dart';
import 'package:mvvm_test_app/view/home_screen.dart';
import 'package:mvvm_test_app/view/login_screen.dart';
import 'package:mvvm_test_app/view/splash_view.dart';

import '../../view/signup_screen.dart';

class Routes{

  static Route<dynamic> generateRoute (RouteSettings settings){

    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => SplashView());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (context) => SignUpScreen());

      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text("No Route Defined"),
            ),
          );
        });
    }
  }

}