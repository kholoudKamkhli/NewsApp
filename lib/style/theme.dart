import 'package:flutter/material.dart';

class MyTheme {
  static final lightTheme = ThemeData(
    primaryColor: Colors.green,
    textTheme: const TextTheme(
      headline5: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: Colors.black,

      ),
      headline6: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.white,

      ),
    )
  );

}