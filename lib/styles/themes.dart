import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: MyColors.darkPink,
        fontFamily: "Aptos Bold",
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
      color: MyColors.lightPink,
      iconTheme: IconThemeData(color: MyColors.darkPurple),
    ),
    colorScheme: ColorScheme.light(
      primary: MyColors.lightPink,
      // primaryVariant: _lightPrimaryVariantColor,
      secondary: MyColors.darkPurple,
      onPrimary: MyColors.pink,
    ),
    iconTheme: IconThemeData(color: MyColors.darkPurple),
    scaffoldBackgroundColor: MyColors.lightPink,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MyColors.lightPink,
      selectedIconTheme: IconThemeData(color: MyColors.darkPurple),
      unselectedIconTheme: IconThemeData(color: MyColors.darkPink),
    ),
  );

  static final ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}
