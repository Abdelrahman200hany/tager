import 'package:flutter/material.dart';

abstract class AppStyle {
  static TextStyle styleBold23(BuildContext context) {
    return TextStyle(
      fontSize: 23,
      fontFamily: 'cairo',
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    
    
  }
   static TextStyle styleSemiBold13(BuildContext context) {
    return TextStyle(
      fontSize: 13,
      fontFamily: 'cairo',
      fontWeight: FontWeight.w600,
      color: const Color(0xff4E5556),
    );
    
    
  }
     static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontFamily: 'cairo',
      fontWeight: FontWeight.w600,
      color: const Color(0xffffffff),
    );
    
    
  }
}
