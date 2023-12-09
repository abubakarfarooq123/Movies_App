import 'package:flutter/material.dart';
import 'package:mvvm_test_app/res/color.dart';

class AppButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;
  const AppButton({super.key,required this.title , this.loading = false,
  required this.onpress
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColor.buttonColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
            child: loading ? CircularProgressIndicator(color: Colors.white,) : Text(
                title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
            ),
        ),
      ),
    );
  }
}
