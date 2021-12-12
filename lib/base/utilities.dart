import 'package:flutter/foundation.dart';

class Utility{
  void printData(String key,String message){
    if(!kReleaseMode){
      // ignore: avoid_print
      print('==>$key: $message\n}');
    }
  }
}