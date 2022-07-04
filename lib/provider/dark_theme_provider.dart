import 'package:flutter/foundation.dart';
import 'package:kstuhelper/servises/dark_theme_prefs.dart';

class DarkThemeProvider with ChangeNotifier{
  DarkThemePrefs darkThemePrefs = DarkThemePrefs();
  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;


  set setDarkTheme (bool value) {
    _darkTheme = value;
    darkThemePrefs.setDarkTheme(value);
    notifyListeners();
  }

}