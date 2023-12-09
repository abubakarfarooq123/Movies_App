import 'package:flutter/material.dart';
import 'package:mvvm_test_app/utils/Routes/routes_name.dart';
import 'package:mvvm_test_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          InkWell(
              onTap: (){
                userProvider.remove().then((value){
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: Center(child: Text("Logout"))),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


        ],
      ),
    );
  }
}
