import 'package:flutter/cupertino.dart';

class AppSpacing{
  double getHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
  // get width screen
  double getWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  double contentPadding = 16.0;

}