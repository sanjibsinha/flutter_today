import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color customGreen50 = Color(0xffccff90);
const Color customGreen100 = Color(0xffa5d6a7);
const Color customGreen300 = Color(0xff76ff03);
const Color customGreen400 = Color(0xff9ccc65);

const Color customGreen900 = Color(0xff1b5a20);
const Color customGreen600 = Color(0xff8bc34a);

const Color customErrorRed = Color(0xFFC5032B);

const Color customSurfaceWhite = Color(0xFFFFFBFA);
const Color customBackgroundWhite = Colors.white;

class GlobalGreenScheme {
  final globalTheme = ThemeData(
    colorScheme: _customColorScheme,
    bottomAppBarColor: customGreen100,
    textTheme: TextTheme(
      button: GoogleFonts.lato(
        fontSize: 25,
        color: customGreen50,
        backgroundColor: customGreen900,
      ),
      bodyText1: GoogleFonts.laila(
        fontSize: 22,
        color: customGreen900,
      ),
      bodyText2: GoogleFonts.lato(
        color: customGreen400,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        backgroundColor: customBackgroundWhite,
      ),
      caption: GoogleFonts.aladin(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: customGreen900,
        backgroundColor: customGreen50,
      ),
      headline1: GoogleFonts.laila(
        color: customGreen900,
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
      headline2: GoogleFonts.aladin(
        color: customGreen400,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: customGreen50,
      // This will control the "back" icon
      iconTheme: const IconThemeData(color: Colors.red),
      // This will control action icon buttons that locates on the right
      actionsIconTheme: const IconThemeData(color: customGreen900),
      centerTitle: false,
      elevation: 15,
      titleTextStyle: GoogleFonts.aladin(
        color: customGreen900,
        fontWeight: FontWeight.bold,
        fontSize: 40,
      ),
    ),
  );
}

const ColorScheme _customColorScheme = ColorScheme(
  primary: customGreen50,
  secondary: Colors.amber,
  surface: Colors.purpleAccent,
  background: customSurfaceWhite,
  error: customGreen900,
  onPrimary: Colors.red,
  onSecondary: Colors.deepOrange,
  onSurface: customGreen300,
  onBackground: customGreen100,
  onError: Colors.redAccent,
  brightness: Brightness.light,
);
