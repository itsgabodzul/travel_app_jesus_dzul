import 'package:flutter/material.dart';


class TravelTheme {
  TravelTheme._();

  static ThemeData get theme => ThemeData (
    primaryColor: const Color(0xff202053),
    scaffoldBackgroundColor: const Colors.white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      tittleTextStyle: Googlefonts.montserrat(
        color: Colors.black,
        fontSize: 20,
        fontWeigh: FontWeight.w500,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xff202053),
    ),
    textTheme: textTheme,
  );

  static TexTheme get textTheeme {
    return TextTheme(
      caption: Googlefonts.montserrat((
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
      subtitle1: Googlefonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: Googlefonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyText1: Googlefonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyText2: Googlefonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      headline6: Googlefonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headline5: Googlefonts.montserrat(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      headline4: Googlefonts.montserrat(
        fontSize: 28,
        fontWeight: FontWeight.w500,
      ),
      headline3: Googlefonts.montserrat(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      headline2: Googlefonts.montserrat(
        fontSize: 36,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      headline1: Googlefonts.montserrat(
        fontSize: 40,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}