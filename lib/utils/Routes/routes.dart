import 'package:flutter/material.dart';
import 'package:mvvm_test_app/utils/Routes/routes_name.dart';
import 'package:mvvm_test_app/view/fvrt_screen.dart';
import 'package:mvvm_test_app/view/home_screen.dart';
import 'package:mvvm_test_app/view/login_screen.dart';
import 'package:mvvm_test_app/view/splash_view.dart';

import '../../view/signup_screen.dart';

class Routes{

  static Route<dynamic> generateRoute (RouteSettings settings){

    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case RoutesName.favourite:
        return MaterialPageRoute(builder: (context) =>  const FavouriteScreen());

      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text("No Route Defined"),
            ),
          );
        });
    }
  }

}