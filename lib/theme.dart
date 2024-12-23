import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 
//Justamente este es el codigo que utiliza el texto dependiendo de la clase


class TravelTheme {
  TravelTheme._();

  static ThemeData get theme => ThemeData (
    primaryColor: const Color(0xff202053),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white, //Color de AppBar
      centerTitle: true, //Centrar
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData( //Color del botom flotante
      backgroundColor: Color(0xff202053),
    ),
    textTheme: textTheme,
  );
 //Crea "tipos de texto"
  static TextTheme get textTheme {
    return TextTheme(
      bodySmall: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
      titleMedium: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: GoogleFonts.montserrat(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: GoogleFonts.montserrat(
        fontSize: 28,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: GoogleFonts.montserrat(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      displayMedium: GoogleFonts.montserrat(
        fontSize: 36,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      displayLarge: GoogleFonts.montserrat(
        fontSize: 40,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}