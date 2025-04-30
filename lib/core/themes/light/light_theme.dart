import 'package:flutter/material.dart';
import 'package:foot_app/core/colors.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: appGreen,
  ),
  primaryColor: appGreen,
  textTheme: _customTextTheme,
  colorScheme: _customColorScheme,
  scaffoldBackgroundColor: appBackGroundGreen,
  useMaterial3: true,
);

const ColorScheme _customColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: appBackGroundGreen,
  onPrimary: appWhite,
  secondary: appGreen,
  onSecondary: appBlack,
  error: Colors.red,
  onError: appBlack,
  surface: appBackGroundGreen,
  onSurface: appBlack,
);

const _customTextTheme = TextTheme(
  bodyLarge: TextStyle(color: appBlack),
  bodyMedium: TextStyle(color: appBlack),
  displayLarge: TextStyle(color: appBlack),
  displayMedium: TextStyle(color: appBlack),
  displaySmall: TextStyle(color: appBlack),
  headlineMedium: TextStyle(color: appBlack),
  headlineSmall: TextStyle(color: appBlack),
  titleLarge: TextStyle(color: appBlack),
  titleMedium: TextStyle(color: appBlack),
  titleSmall: TextStyle(color: appBlack),
  labelLarge: TextStyle(color: appBlack),
  bodySmall: TextStyle(color: appBlack),
  labelSmall: TextStyle(color: appBlack),
);
