

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{

  static toast(String message){
    Fluttertoast.showToast( msg: message);
  }
  static focusmove(BuildContext context,FocusNode currentnode, FocusNode nextnode){
    currentnode.unfocus();
    FocusScope.of(context).requestFocus(nextnode);

  }

  static flashbar(BuildContext context,String message){
    showFlushbar(context: context, flushbar: Flushbar(
      message: message,
      icon: Icon(Icons.error,size: 30,color: Colors.white,),
      positionOffset: 20,
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 2),
    )..show(context));
  }

}