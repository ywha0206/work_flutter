import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart_app/constants.dart';

ThemeData mTheme() {
  return ThemeData(
    primarySwatch: kPrimaryColor,
    scaffoldBackgroundColor: kPrimaryColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          backgroundColor: kAccentColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          minimumSize: Size(350, 50)),
    ),
  );
}
