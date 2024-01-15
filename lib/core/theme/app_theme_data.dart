import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_values.dart';

class AppThemeData {
  static ThemeData getTheme(BuildContext context) {
    const Color primaryColor = ColorValues.primary;
    final Map<int, Color> primaryColorMap = {
      50: primaryColor,
      100: primaryColor,
      200: primaryColor,
      300: primaryColor,
      400: primaryColor,
      500: primaryColor,
      600: primaryColor,
      700: primaryColor,
      800: primaryColor,
      900: primaryColor,
    };
    final MaterialColor primaryMaterialColor =
        MaterialColor(primaryColor.value, primaryColorMap);

    return ThemeData(
        primaryColor: primaryColor,
        primarySwatch: primaryMaterialColor,
        scaffoldBackgroundColor: const Color(0xffF5F5F5),
        canvasColor: const Color(0xffF5F5F5),
        brightness: Brightness.light,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedLabelStyle: GoogleFonts.publicSans(
                fontSize: 16, color: ColorValues.primary),
            unselectedLabelStyle: GoogleFonts.poppins(
              fontSize: 16,
            ),
            selectedIconTheme: const IconThemeData(color: ColorValues.primary),
            unselectedIconTheme: const IconThemeData(color: Colors.black)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 45),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                textStyle: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ))),
        tabBarTheme: TabBarTheme(
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: GoogleFonts.publicSans(
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: GoogleFonts.publicSans(
            fontWeight: FontWeight.w500,
          ),
        ),
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            color: Color(0xff7F7F7F),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: GoogleFonts.urbanist(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: const Color(0xff0B090A),
          ),
          toolbarTextStyle: GoogleFonts.publicSans(
            fontWeight: FontWeight.w700,
          ),
        ),
        textTheme: GoogleFonts.publicSansTextTheme());
  }
}
