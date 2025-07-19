

import 'package:flutter/material.dart';

import '../constants/fonts.dart';
import '../constants/style.dart';

class AppTheme {

  static lightTheme() {
    return ThemeData(
      brightness: Brightness.light,

      scaffoldBackgroundColor: Colors.white.withValues(alpha: 0.97),
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: Style.primaryColor,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Style.primaryColor,
          onPrimary: Colors.black,
          secondary: Style.secondaryColor,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.red,
          surface: Colors.white,
          onSurface: Colors.black),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Style.lightSubTextColor,
        ),
          bodyLarge: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w400,
            fontFamily: Fonts.geometr,
            color: Style.lightTextColor,
          )
      ),


      elevatedButtonTheme: ElevatedButtonThemeData(

        style: ButtonStyle(
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          backgroundColor: WidgetStateProperty.all(Style.primaryColor),
          foregroundColor: WidgetStateProperty.all(Colors.white), // default white text
          textStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return const TextStyle(
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.white,
                    offset: Offset(0, 0),
                    blurRadius: 4,
                  ),
                ],
              );
            }
            return const TextStyle(
              color: Colors.white,
            );
          }),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xff24BAEC),

        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}