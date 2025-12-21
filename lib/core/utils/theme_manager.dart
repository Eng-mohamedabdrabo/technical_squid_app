import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';

abstract class ThemeManager {
  static ThemeData getAppTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: ColorManager.lightBackground,
      fontFamily: 'Poppins',
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
