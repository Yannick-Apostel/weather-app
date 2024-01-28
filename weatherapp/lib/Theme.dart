import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final Color _lightPrimaryColor = Colors.white;
  static final Color _lightOnPrimary = Colors.black;
  static final Color _darkPrimaryColor = Colors.grey[900]!;
  static final Color _darkOnPrimaryColor = Colors.white;

  static final Color darkDelOrClr = const Color.fromARGB(255, 126, 250, 250);
  static final Color darkOprand = Colors.white;
  static final Color darkNum = const Color.fromARGB(255, 126, 180, 224);

  static final Color lightDelOrClr = const Color(0xff5EEBE0);
  static final Color lightOprand = const Color(0xff78F0BE);
  static final Color lightNum = const Color(0xff5EC8EB);
  static final Color _lightBackground = const Color(0xfff2fa4d6);

  static final TextStyle _lightHeadingText = TextStyle(
    color: _lightOnPrimary,
    fontSize: 20,
  );
  static final TextStyle _lightBodyText = TextStyle(
    color: _lightOnPrimary,
    fontSize: 16,
  );

  static final TextStyle _darkHeadingText =
      _lightHeadingText.copyWith(color: _darkOnPrimaryColor);

  static final TextStyle _darkbodyText =
      _lightBodyText.copyWith(color: _darkOnPrimaryColor);

  static final TextTheme _lightTextTheme =
      TextTheme(titleLarge: _lightHeadingText, bodyMedium: _lightBodyText);

  static final TextTheme _darkTextTheme =
      TextTheme(titleLarge: _lightHeadingText, bodyMedium: _lightBodyText);

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: _lightPrimaryColor,
      colorScheme: ColorScheme.light(
          background: _lightBackground,
          primary: _lightOnPrimary,
          onPrimary: _lightOnPrimary,
          secondary: lightDelOrClr,
          onSecondary: _lightOnPrimary,
          tertiary: lightNum,
          onTertiary: lightOprand),
      textTheme: _lightTextTheme);

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: _darkPrimaryColor,
      colorScheme: ColorScheme.dark(
          primary: _lightOnPrimary,
          onPrimary: _darkOnPrimaryColor,
          secondary: darkDelOrClr,
          onSecondary: _darkOnPrimaryColor,
          tertiary: darkNum,
          onTertiary: darkOprand),
      textTheme: _darkTextTheme);
}
