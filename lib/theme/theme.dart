import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

ThemeData myTheme() {
  return ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        titleMedium: GoogleFonts.inter(
            fontSize: 20, fontWeight: FontWeight.w500, color: titleMediumColor),
      ),
      iconTheme: const IconThemeData(color: Colors.white, size: 20),
      filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
              textStyle: WidgetStatePropertyAll(
                  GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w600)),
              shape: const WidgetStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.zero)))),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: primaryColor,
          onPrimary: onPrimaryColor,
          secondary: secondaryColor,
          onSecondary: onSecondaryColor,
          error: errorColor,
          onError: onErrorColor,
          background: backgroundColor,
          onBackground: onBackgroundColor,
          surface: surfaceColor,
          surfaceTint: surfaceColor,
          onSurfaceVariant: onSurfaceColor,
          onSurface: onSurfaceColor));
}

TextStyle myStyle() {
  return const TextStyle();
}
