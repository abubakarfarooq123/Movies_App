import 'package:flutter/material.dart';
import 'package:mvvm_test_app/res/component/button.dart';
import 'package:mvvm_test_app/utils/Routes/routes_name.dart';
import 'package:mvvm_test_app/utils/utils.dart';
import 'package:mvvm_test_app/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  ValueNotifier<bool> _obsure = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();


  @override
  void dispose() {
    // TODO: implement dispose

    emailFocus.dispose();
    passwordFocus.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _obsure.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthViewModel>(context);
    final heigh = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              focusNode: emailFocus,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.alternate_email_outlined),
              ),
              onFieldSubmitted: (value){
                Utils.focusmove(context,emailFocus,passwordFocus);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ValueListenableBuilder(
              valueListenable: _obsure,
              builder: (context, value,child){
                return TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _passwordController,
                  obscureText: _obsure.value,
                  obscuringCharacter: '*',
                  focusNode: passwordFocus,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                        onTap: (){
                          _obsure.value = !_obsure.value;
                        },
                        child: Icon( _obsure.value ? Icons.visibility_off : Icons.visibility)),

                  ),
                );
              },

            ),
          ),
          SizedBox(
            height: heigh * 0.085,
          ),
          AppButton(
              title: 'Login',
              loading: authProvider.loading,
              onpress: (){
            if(_emailController.text.isEmpty){
              Utils.flashbar(context, 'Please Enter Email');
            }
            else if (_passwordController.text.isEmpty){
              Utils.flashbar(context, 'Please Enter Password');
              }
            else if (_passwordController.text.length < 6){
              Utils.flashbar(context, 'Please Enter 6 Digit Password');
            }
            else {
              Map data = {
                'email' : _emailController.text.toString(),
                'password': _passwordController.text.toString(),
              };
              authProvider.loginApi(data, context);
            }
          }
          ),
          SizedBox(
            height:  heigh * 0.06,
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutesName.signup);
            },
            child: Text(
              "Don't have an Account? SignUp"
            ),
          ),
        ],
      ),
    );
  }
}
