import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeConfig {
  static const Color _scaffoldBackgroundColor = Color(0xFF19191f);

  static const Color _darkPrimaryColor = _scaffoldBackgroundColor;
  static const Color _darkOnPrimaryColor = Color(0xFF7a7a83); // such az search box icon or app bar icon color
  static const Color _darkPrimaryContainer = Color(0xFF202026); // such az list of crypto item color

  static const Color _darkSecondaryColor = Colors.white;

  static final AppBarTheme _darkAppBarTheme = AppBarTheme(
    elevation: 0.0,
    centerTitle: true,
    backgroundColor: _darkPrimaryColor,
    iconTheme: IconThemeData(
      color: _darkOnPrimaryColor,
      size: 25.r,
    ),
  );

  static final IconThemeData _darkIconTheme = IconThemeData(
    color: _darkOnPrimaryColor,
    size: 22.r,
  );

  static const InputDecorationTheme _darkInputDecorationTheme = InputDecorationTheme(
    border: InputBorder.none,
    prefixIconColor: _darkOnPrimaryColor,
    suffixIconColor: _darkOnPrimaryColor,
  );

  static const ColorScheme _darkColorScheme = ColorScheme.dark(
    primary: _darkPrimaryColor,
    onPrimary: _darkOnPrimaryColor,
    primaryContainer: _darkPrimaryContainer,
    secondary: _darkSecondaryColor,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _scaffoldBackgroundColor,
    colorScheme: _darkColorScheme,
    appBarTheme: _darkAppBarTheme,
    iconTheme: _darkIconTheme,
    inputDecorationTheme: _darkInputDecorationTheme,
  );
}
