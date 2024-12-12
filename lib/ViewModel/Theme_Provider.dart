// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class Theme_Changer_Provider extends ChangeNotifier {
//   //initially the theme will be light
//   var _themeMode = ThemeMode.light;

//   ThemeMode get themeMode => _themeMode;

//   void setTheme(themeMode) {
//     _themeMode = themeMode;
//     notifyListeners();
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Theme_Changer_Provider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  Theme_Changer_Provider() {
    _loadTheme();
  }

  void setTheme(ThemeMode themeMode) async {
    _themeMode = themeMode;
    notifyListeners();

    // Save the theme mode to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', themeMode.toString());
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    String? storedTheme = prefs.getString('themeMode');

    if (storedTheme != null) {
      if (storedTheme == ThemeMode.light.toString()) {
        _themeMode = ThemeMode.light;
      } else if (storedTheme == ThemeMode.dark.toString()) {
        _themeMode = ThemeMode.dark;
      } else {
        _themeMode = ThemeMode.system;
      }
    }
    notifyListeners();
  }
}



// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class ThemeChangerProvider with ChangeNotifier {
// //   ThemeMode _themeMode = ThemeMode.light;

// //   ThemeMode get themeMode => _themeMode;

// //   ThemeChangerProvider() {
// //     // Load theme from SharedPreferences when the provider is created
// //     _loadThemeFromPrefs();
// //   }

// //   void setTheme(ThemeMode themeMode) async {
// //     _themeMode = themeMode;
// //     notifyListeners();

// //     // Save the selected theme to SharedPreferences
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     await prefs.setString('themeMode', themeMode.toString());
// //   }

// //   Future<void> _loadThemeFromPrefs() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     String? themeString = prefs.getString('themeMode');

// //     // Set the theme based on the saved value
// //     if (themeString != null) {
// //       switch (themeString) {
// //         case 'ThemeMode.light':
// //           _themeMode = ThemeMode.light;
// //           break;
// //         case 'ThemeMode.dark':
// //           _themeMode = ThemeMode.dark;
// //           break;
// //         case 'ThemeMode.system':
// //           _themeMode = ThemeMode.system;
// //           break;
// //         default:
// //           _themeMode = ThemeMode.light;
// //       }
// //     }
// //     notifyListeners();
// //   }
// // }
