import 'package:flutter/material.dart';
import 'package:mvvm_test_app/view_model/services/splash_services.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices services = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    services.checkAuth(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Splash Screen',style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),),
          )
        ],
      ),
    );
  }
}
