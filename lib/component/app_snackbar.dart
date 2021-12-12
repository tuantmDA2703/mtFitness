import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSnackBar{
  final GlobalKey<ScaffoldMessengerState> snackBarKey =
  GlobalKey<ScaffoldMessengerState>();

  showSuccess(String message){
    snackBarKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.green,
        )
    );
  }
  showUnsuccessful(String message){
    snackBarKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        )
    );
  }

}