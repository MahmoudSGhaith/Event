import 'package:event/core/resources/colors/colors_manger.dart';
import 'package:event/core/resources/styles/styles_manger.dart';
import 'package:flutter/material.dart';

class ThemeManger {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: ColorsManger.light,
    primaryColor: ColorsManger.primary,
    primaryColorDark: ColorsManger.primary,
    shadowColor: ColorsManger.grey,
    splashColor: ColorsManger.light,
    canvasColor: ColorsManger.light,
    focusColor: ColorsManger.primary,
    hoverColor: ColorsManger.black,
    textTheme: TextTheme(
      titleMedium: StylesManger.bold15black,
      titleLarge: StylesManger.medium18Primary,
      titleSmall: StylesManger.medium15grey,
      labelMedium: StylesManger.medium18black,
      labelSmall: StylesManger.boldItalic15primary,
      displaySmall: StylesManger.bold15Primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: ColorsManger.grey,
      focusColor: ColorsManger.black,
      prefixIconColor: ColorsManger.grey,
      suffixIconColor: ColorsManger.grey,
      hintStyle: StylesManger.medium15grey,
      labelStyle: StylesManger.medium15grey,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: ColorsManger.grey, width: 1),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: ColorsManger.grey, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: ColorsManger.black, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: ColorsManger.grey.withAlpha(100),
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: ColorsManger.red, width: 2),
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorsManger.light,
      titleTextStyle: StylesManger.medium18Primary,
      iconTheme: IconThemeData(color: ColorsManger.primary)
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsManger.primary,
      selectedItemColor: ColorsManger.white,
      unselectedItemColor: ColorsManger.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManger.primary,
      foregroundColor: ColorsManger.white,
      elevation: 0,
      shape: StadiumBorder(
        side: BorderSide(color: ColorsManger.white, width: 4),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: ColorsManger.dark,
    primaryColor: ColorsManger.primary,
    primaryColorDark: ColorsManger.light,
    shadowColor: ColorsManger.primary,
    canvasColor: ColorsManger.primary,
    splashColor: ColorsManger.dark,
    focusColor: ColorsManger.dark,
    hoverColor: ColorsManger.white,
    textTheme: TextTheme(
      titleMedium: StylesManger.bold15white,
      titleLarge: StylesManger.medium18Primary,
      titleSmall: StylesManger.medium15white,
      labelMedium: StylesManger.medium18white,
      labelSmall: StylesManger.boldItalic15primary,
      displaySmall: StylesManger.bold15Primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: ColorsManger.white,
      hintStyle: StylesManger.medium15white,
      labelStyle: StylesManger.medium15white,
      focusColor: ColorsManger.blue,
      prefixIconColor: ColorsManger.white,
      suffixIconColor: ColorsManger.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: ColorsManger.primary, width: 1),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: ColorsManger.primary, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: ColorsManger.white, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: ColorsManger.grey.withAlpha(100),
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: ColorsManger.red, width: 2),
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorsManger.dark,
      titleTextStyle: StylesManger.medium18Primary,
      iconTheme: IconThemeData(color: ColorsManger.light)
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsManger.dark,
      selectedItemColor: ColorsManger.white,
      unselectedItemColor: ColorsManger.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManger.dark,
      foregroundColor: ColorsManger.white,
      elevation: 0,
      shape: StadiumBorder(
        side: BorderSide(color: ColorsManger.white, width: 4),
      ),
    ),
  );
}
