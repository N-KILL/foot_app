import 'package:flutter/material.dart';
import 'package:foot_app/core/colors.dart';

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: appDarkGreen,
  ),
  primaryColor: appDarkGreen,
  textTheme: _customTextTheme,
  colorScheme: _customColorScheme,
  scaffoldBackgroundColor: appBlack,
  useMaterial3: true,
);

const ColorScheme _customColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: appBlack,
  onPrimary: appWhite,
  secondary: appDarkGreen,
  onSecondary: appWhite,
  error: Colors.red,
  onError: appWhite,
  surface: appWhite,
  onSurface: appBlack,
  tertiary: Colors.blue, 
);

const _customTextTheme = TextTheme(
  bodyLarge: TextStyle(color: appWhite),
  bodyMedium: TextStyle(color: appWhite),
  displayLarge: TextStyle(color: appWhite),
  displayMedium: TextStyle(color: appWhite),
  displaySmall: TextStyle(color: appWhite),
  headlineMedium: TextStyle(color: appWhite),
  headlineSmall: TextStyle(color: appWhite),
  titleLarge: TextStyle(color: appWhite),
  titleMedium: TextStyle(color: appWhite),
  titleSmall: TextStyle(color: appWhite),
  labelLarge: TextStyle(color: appWhite),
  bodySmall: TextStyle(color: appWhite),
  labelSmall: TextStyle(color: appWhite),
);
