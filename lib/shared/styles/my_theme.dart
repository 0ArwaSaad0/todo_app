import 'package:flutter/material.dart';
import 'package:todo_app/shared/styles/colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    primaryColor: LIGHTPRIMARY,
    scaffoldBackgroundColor: GREENBackgground,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      background: Colors.transparent,
      onBackground: Colors.white,
      primary: LIGHTPRIMARY,
      onPrimary: Colors.white,
      surface: Colors.white,
      onSurface: Colors.grey,
      secondary: GREENCOLOR,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      subtitle1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: LIGHTPRIMARY,
      ),
      subtitle2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: GREENCOLOR,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: LIGHTPRIMARY,
      elevation: 20,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
      selectedLabelStyle: TextStyle(color: DARKBOLD, fontSize: 22),
      selectedIconTheme: IconThemeData(
        size: 30,
        color: LIGHTPRIMARY,
      ),
      unselectedIconTheme: IconThemeData(
        size: 28,
        color: Colors.grey,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: LIGHTPRIMARY,
      shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 3)),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: DARKPRIMARY,
    scaffoldBackgroundColor: LIGHTDARK,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      background: Colors.transparent,
      onBackground: LIGHTDARK,
      primary: DARKPRIMARY,
      onPrimary: LIGHTDARK,
      surface: DARKPRIMARY,
      onSurface: Colors.grey,
      secondary: LIGHTPRIMARY,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: DARKBOLD,
      ),
      subtitle1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: LIGHTPRIMARY,
      ),
      subtitle2: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: LIGHTPRIMARY,
      elevation: 20,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      selectedLabelStyle: TextStyle(color: LIGHTPRIMARY, fontSize: 22),
      selectedIconTheme: IconThemeData(size: 30, color: LIGHTPRIMARY),
      unselectedIconTheme: IconThemeData(
        size: 28,
        color: Colors.white,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0,
      backgroundColor: LIGHTPRIMARY,
      shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 3)),
    ),
  );
}
