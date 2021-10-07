import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

final theme = ThemeData(
  primarySwatch: Colors.pink,
  fontFamily: 'Pretendard',
  backgroundColor: const Color(0xFFFFFFFF),
  focusColor: const Color(0xFFDE1568),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  accentColor: const Color(0xFFDE1568),
  primaryColor: const Color(0xFFDE1568),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.only(left: 11, bottom: 10, top: 10, right: 11),
    labelStyle: TextStyle(
        fontFamily: 'Pretendard',
        fontSize: Adaptive.dp(14),
        fontWeight: FontWeight.w300),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1, color: const Color(0xFFDE1568))),
  ),
  textTheme: TextTheme(
      headline1: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: Adaptive.dp(40),
          fontWeight: FontWeight.w900,
          color: Colors.black),
      headline2: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: Adaptive.dp(30),
          fontWeight: FontWeight.w900,
          color: Colors.black),
      headline3: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: Adaptive.dp(25),
          fontWeight: FontWeight.w900,
          color: Colors.black),
      headline4: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: Adaptive.dp(20),
          fontWeight: FontWeight.w700,
          color: Colors.black),
      headline5: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: Adaptive.dp(15),
          fontWeight: FontWeight.w700,
          color: Colors.black),
      headline6: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: Adaptive.dp(12),
          fontWeight: FontWeight.w700,
          color: Colors.black),
      subtitle1: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: Adaptive.dp(15),
          fontWeight: FontWeight.w300,
          color: Colors.black),
      bodyText1: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: Adaptive.dp(15),
          fontWeight: FontWeight.w500,
          color: Colors.black),
      bodyText2: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: Adaptive.dp(12),
          fontWeight: FontWeight.w500,
          color: Colors.black),
      button: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: Adaptive.dp(15),
          fontWeight: FontWeight.w700,
          color: Colors.black)),
  // textTheme:
);
