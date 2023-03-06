import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok_clone/constants/sizes.dart';

ThemeData darkThemeData() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black54,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.openSans(
          fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      displayMedium: GoogleFonts.openSans(
          fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      displaySmall:
          GoogleFonts.openSans(fontSize: 48, fontWeight: FontWeight.w400),
      headlineMedium: GoogleFonts.openSans(
          fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headlineSmall:
          GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.w400),
      titleLarge: GoogleFonts.openSans(
          fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      titleMedium: GoogleFonts.openSans(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      titleSmall: GoogleFonts.openSans(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyLarge: GoogleFonts.roboto(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyMedium: GoogleFonts.roboto(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      labelLarge: GoogleFonts.roboto(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      bodySmall: GoogleFonts.roboto(
          fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      labelSmall: GoogleFonts.roboto(
          fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ),
    primaryColor: const Color(0xFFE9435A),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xFFE9435A),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.grey.shade900,
      scrolledUnderElevation: 1,
      elevation: 0,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: Sizes.size16 + Sizes.size2,
        fontWeight: FontWeight.w600,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.grey.shade900,
    ),
    tabBarTheme: const TabBarTheme(
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: Sizes.size2,
          ),
        ),
      ),
    ),
  );
}
