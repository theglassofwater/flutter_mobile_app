import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Aptos",
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: MyColors.darkPink,
        fontFamily: "Aptos",
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
      color: Colors.white,
      iconTheme: IconThemeData(color: MyColors.darkPurple),
    ),
    colorScheme: ColorScheme.light(
      primary: MyColors.lightPink,
      // primaryVariant: _lightPrimaryVariantColor,
      secondary: MyColors.darkPurple,
      onPrimary: MyColors.pink,
    ),
    iconTheme: IconThemeData(color: MyColors.darkPurple),
    // scaffoldBackgroundColor: const Color.fromARGB(255, 206, 206, 206), // grey background
    scaffoldBackgroundColor: MyColors.lightPink,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedIconTheme: IconThemeData(color: MyColors.darkPurple),
      unselectedIconTheme: IconThemeData(color: MyColors.darkPink),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: MyColors.darkPink),
      titleMedium: null,
      titleSmall: TextStyle(color: MyColors.darkPink),
      bodyLarge: null,
      bodyMedium: null,
      bodySmall: null,
      displayLarge: null,
      displayMedium: null,
      displaySmall: null,
    ),
    dividerTheme: DividerThemeData(
      color: Colors.transparent,
    ), // persistentFooterButtons in onboarding is hardcoded to have divider, this removes it
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "SfBold",
  );
}
