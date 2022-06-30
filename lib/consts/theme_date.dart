import 'package:flutter/material.dart';

class Styles{
  static ThemeData themeData( bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor:
        isDarkTheme ? const Color(0xFF00001a) : const Color(0xFFFFFFFF),
      primaryColor: Color.fromRGBO(202, 105, 105, 1),
      colorScheme: ThemeData().colorScheme.copyWith(
      secondary:
        isDarkTheme ? const Color(0xFF00001a) : const Color(0xFFFFFFFF),
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        ),
      cardColor:
          isDarkTheme ? const Color(0xFF00001a) : const Color(0xFFFFFFFF),
      canvasColor:
          isDarkTheme ? const Color(0xFF00001a) : const Color(0xA6FFFFFF),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: isDarkTheme
            ? const ColorScheme.dark()
            : const ColorScheme.light(),
      )
    );
  }
}