import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:technical_squid_app/core/utils/color_manager.dart';

abstract class ThemeManager {
  static ThemeData getAppTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: ColorManager.lightBackground,
      textTheme: GoogleFonts.cairoTextTheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorManager.lightBackground,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.lightCard,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
    );
  }
}
