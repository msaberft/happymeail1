import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProvTheme with ChangeNotifier {
  var primaryColor = Colors.red;
  var accentColor = Colors.amber;
  var tm = ThemeMode.system;
  String themeText = 's';

  onChanged(newColor, n) async {
    n == 1
        ? primaryColor = _toMaterialColor(newColor.hashCode)
        : accentColor = _toMaterialColor(newColor.hashCode);

    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('primaryColor', primaryColor.value);
    prefs.setInt('accentColor', accentColor.value);
  }

  getColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    primaryColor = _toMaterialColor(prefs.getInt('primaryColor') ?? 0xFFF44336);
    accentColor = _toMaterialColor(prefs.getInt('accentColor') ?? 0xFFFFC107);
    notifyListeners();
  }

  MaterialColor _toMaterialColor(colorVal) {
    return MaterialColor(
      colorVal,
      <int, Color>{
        50: Color(0xFFFFEBEE),
        100: Color(0xFFFFCDD2),
        200: Color(0xFFEF9A9A),
        300: Color(0xFFE57373),
        400: Color(0xFFEF5350),
        500: Color(colorVal),
        600: Color(0xFFE53935),
        700: Color(0xFFD32F2F),
        800: Color(0xFFC62828),
        900: Color(0xFFB71C1C),
      },
    );
    notifyListeners();
  }

  void themeModeChange(newThemeVal) async {
    tm = newThemeVal;
    getThemeText(tm);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('themeText', themeText);
    notifyListeners();
  }

  getThemeText(ThemeMode tm) {
    if (tm == ThemeMode.system) {
      themeText = 's';
    } else if (tm == ThemeMode.dark) {
      themeText = 'd';
    } else if (tm == ThemeMode.light) {
      themeText = 'l';
    }
  }

  getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    themeText = prefs.getString('themeText') ?? 's';
    if (themeText == 's') {
      tm = ThemeMode.system;
    } else if (themeText == 'd') {
      tm = ThemeMode.dark;
    } else if (themeText == 'l') {
      tm = ThemeMode.light;
    }
    notifyListeners();
  }
}
