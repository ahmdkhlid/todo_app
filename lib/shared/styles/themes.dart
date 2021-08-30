//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  accentColor: Colors.grey[300],
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: defaultColor,
  ),
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    iconTheme: IconThemeData(
      size: 20.0,
      color: Colors.grey,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontFamily: 'Aladin',
      color: Colors.black45,
      fontSize: 25.0,
      fontWeight: FontWeight.w400,
    ),
    titleSpacing: 20.0,
    actionsIconTheme: IconThemeData(
      color: Colors.black45,
      size: 20.0,
    ),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontSize: 18.0,
    ),
    bodyText2: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black45,
      fontSize: 16.0,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 5.0,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.black26,
  ),
  fontFamily: 'Aladin',
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade800,
  primarySwatch: defaultColor,
  accentColor: Colors.grey[300],
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.grey,
  ),
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    backgroundColor: Colors.black26,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black26,
      statusBarIconBrightness: Brightness.light,
    ),
    iconTheme: IconThemeData(
      size: 20.0,
      color: Colors.blueGrey,
    ),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontFamily: 'Aladin',
      color: Colors.grey.shade600,
      fontSize: 25.0,
      fontWeight: FontWeight.w400,
    ),
    titleSpacing: 20.0,
    actionsIconTheme: IconThemeData(
      color: Colors.grey.shade600,
      size: 20.0,
    ),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.grey,
      fontSize: 18.0,
    ),
    bodyText2: TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.grey,
      fontSize: 16.0,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 0.0,
    backgroundColor: Colors.black26,
    selectedItemColor: Colors.deepOrange,
    enableFeedback: true,
    unselectedItemColor: Colors.grey.shade800,
  ),
  fontFamily: 'Aladin',
);
