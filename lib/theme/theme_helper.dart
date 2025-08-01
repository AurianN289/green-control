import 'package:flutter/material.dart';

String _appTheme = "lightCode";
LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  LightCodeColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  Color get black => Color(0xFF1E1E1E);
  Color get white => Color(0xFFFFFFFF);
  Color get gray400 => Color(0xFF9CA3AF);

  Color get whiteCustom => Colors.white;
  Color get blackCustom => Colors.black;
  Color get transparentCustom => Colors.transparent;
  Color get greyCustom => Colors.grey;
  Color get redCustom => Colors.red;
  Color get colorFFF5F5 => Color(0xFFF5F5F5);
  Color get colorFF2F7D => Color(0xFF2F7D3C);
  Color get colorFF6666 => Color(0xFF666666);
  Color get colorFF3333 => Color(0xFF333333);
  Color get colorFFDDDD => Color(0xFFDDDDDD);
  Color get colorFF8888 => Color(0xFF888888);
  Color get colorFFCCCC => Color(0xFFCCCCCC);
  Color get colorFF4444 => Color(0xFF444444);
  Color get colorFF57B4 => Color(0xFF57B46A);
  Color get colorFF7575 => Color(0xFF757575);
  Color get colorFFE0E0 => Color(0xFFE0E0E0);

  Color get colorFFD94D => Color(0xFFD94D4D);
  Color get colorFFA1A1 => Color(0xFFA1A1A1);
  Color get colorFF1E7E => Color(0xFF1E7E34);
  Color get colorFFE8F7 => Color(0xFFE8F7EE);
  Color get colorFF9462 => Color(0xFF946200);
  Color get colorFFFFF7 => Color(0xFFFFF7D6);
  Color get colorFFFFCC => Color(0xFFFFCC00);

  Color get grey200 => Colors.grey.shade200;
  Color get grey100 => Colors.grey.shade100;
}
