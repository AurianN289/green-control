import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Display Styles
  // Large text styles for major headings

  TextStyle get display32Bold => TextStyle(
        fontSize: 32.fSize,
        fontWeight: FontWeight.bold,
        color: appTheme.colorFF2F7D,
      );

  TextStyle get display31Bold => TextStyle(
        fontSize: 31.fSize,
        fontWeight: FontWeight.bold,
        color: appTheme.colorFF2F7D,
      );

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title22Bold => TextStyle(
        fontSize: 22.fSize,
        fontWeight: FontWeight.bold,
        color: appTheme.colorFF2F7D,
      );

  TextStyle get title20RegularRoboto => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  TextStyle get title16Bold => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.bold,
        color: const Color(
            0xFFA1A1A1), // Modified: Replaced unavailable theme color
      );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body15Regular => TextStyle(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w400,
        color: appTheme.colorFF7575,
      );

  TextStyle get body15Bold => TextStyle(
        fontSize: 15.fSize,
        fontWeight: FontWeight.bold,
        color: appTheme.colorFF4444,
      );

  TextStyle get body14 => TextStyle(
        fontSize: 14.fSize,
        color: appTheme.colorFF6666,
      );

  TextStyle get body14Medium => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
        color: appTheme.colorFF4444,
      );

  TextStyle get body13 => TextStyle(
        fontSize: 13.fSize,
        color: appTheme.colorFF3333,
      );

  TextStyle get body13Bold => TextStyle(
        fontSize: 13.fSize,
        fontWeight: FontWeight.bold,
        color: appTheme.colorFF2F7D,
      );

  TextStyle get body12 => TextStyle(
        fontSize: 12.fSize,
        color: appTheme.colorFF8888,
      );

  TextStyle get body12Bold => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.bold,
        color: appTheme.colorFF2F7D,
      );

  // Other Styles
  // Miscellaneous text styles without specified font size

  TextStyle get bodyTextInter => TextStyle(
        fontFamily: 'Inter',
      );
}
