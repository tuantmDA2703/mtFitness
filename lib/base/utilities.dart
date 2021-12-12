import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mt_fitness/component/app_snackbar.dart';

class Utility{
  void printData(String key,String message){
    if(!kReleaseMode){
      // ignore: avoid_print
      print('==>$key: $message\n');
    }
  }

  var snackBar = GetIt.I<AppSnackBar>();
}