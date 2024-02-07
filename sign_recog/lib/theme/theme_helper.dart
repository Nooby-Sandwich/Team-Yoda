import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

String _appTheme = "primary";

/// Helper class for managing themes and colors.
class ThemeHelper {
  String _appTheme = "primary";

  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors(),
    'dark': DarkPrimaryColors(),
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme,
    'dark': ColorSchemes.darkColorScheme,
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found. Make sure you have added this theme class in JSON. Try running flutter pub run build_runner");
    }
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found. Make sure you have added this theme class in JSON. Try running flutter pub run build_runner");
    }
    var colorScheme = _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimaryContainer,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primary,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.onSecondaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: colorScheme.primary,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();

  /// Returns the dark theme data.
  ThemeData getDarkThemeData() {
    var darkColorScheme = _supportedColorScheme['dark'] ?? ColorSchemes.darkColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: darkColorScheme,
      textTheme: TextThemes.textTheme(darkColorScheme),
      scaffoldBackgroundColor: darkColorScheme.background,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: darkColorScheme.primary,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkColorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: darkColorScheme.primary,
      ),
    );
  }
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodyLarge: TextStyle(
      color: appTheme.black900,
      fontSize: 18.fSize,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: appTheme.gray600,
      fontSize: 14.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    ),
    headlineLarge: TextStyle(
      color: colorScheme.onPrimaryContainer,
      fontSize: 30.fSize,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      color: colorScheme.onPrimaryContainer,
      fontSize: 28.fSize,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      color: colorScheme.onPrimaryContainer,
      fontSize: 25.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      color: colorScheme.onSecondaryContainer,
      fontSize: 20.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      color: colorScheme.onSecondaryContainer,
      fontSize: 16.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      color: colorScheme.onSecondaryContainer,
      fontSize: 14.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    ),
  );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFFE5E7EB),
    primaryContainer: Color(0XFF374151),
    secondaryContainer: Color(0XFFD1D5DB),

    // Error colors
    errorContainer: Color(0XFF9CA3AF),

    // On colors(text colors)
    onPrimary: Color(0XFF1F2A37),
    onPrimaryContainer: Color(0XFFFFFFFF),
    onSecondaryContainer: Color(0XFF1C2A3A),
  );

  static final darkColorScheme = ColorScheme.dark(
    // Dark color scheme colors
    primary: Color(0xFF212121),
    primaryContainer: Color(0xFF1F1F1F),
    secondaryContainer: Color(0xFF303030),
    errorContainer: Color(0xFFB00020),
    onPrimary: Colors.white,
    onPrimaryContainer: Color(0xFFE0E0E0),
    onSecondaryContainer: Color(0xFFE0E0E0),
  );
}

class PrimaryColors {
  // Light theme colors
  Color get black900 => Color(0XFF000000);
  Color get blueA700 => Color(0XFF1C64F2);
  Color get blueGray700 => Color(0XFF4B5563);
  Color get deepOrange600 => Color(0XFFF24E1E);
  Color get gray100 => Color(0XFFF3F4F6);
  Color get gray200 => Color(0XFFEAEAEA);
  Color get gray20001 => Color(0XFFEEEEEE);
  Color get gray400 => Color(0XFFC9C9C9);
  Color get gray50 => Color(0XFFF9FAFB);
  Color get gray500 => Color(0XFFADADAD);
  Color get gray600 => Color(0XFF6B7280);
  Color get gray800 => Color(0XFF4B4B4B);
  Color get gray900 => Color(0XFF111111);
  Color get green50 => Color(0XFFDEF7E4);
  Color get indigo9003f => Color(0X3F1E426D);
  Color get red500 => Color(0XFFEA4335);
  Color get redA700 => Color(0XFFF70D0D);
  Color get teal900 => Color(0XFF014737);
}

class DarkPrimaryColors  extends PrimaryColors {
  // Dark theme colors
  Color get black900 => Color(0xFF000000);
  Color get darkBlue => Color(0xFF123456);
  Color get darkGray => Color(0xFF333333);
  Color get darkGreen => Color(0xFF007F00);
  Color get darkRed => Color(0xFF800000);
  Color get darkTeal => Color(0xFF004D40);
  Color get gray100 => Color(0XFFF3F4F6);
  Color get gray200 => Color(0XFFEAEAEA);
  Color get gray20001 => Color(0XFFEEEEEE);
  Color get gray400 => Color(0XFFC9C9C9);
  Color get gray50 => Color(0XFFF9FAFB);
  Color get gray500 => Color(0XFFADADAD);
  Color get gray600 => Color(0XFF6B7280);
  Color get gray800 => Color(0XFF4B4B4B);
  Color get gray900 => Color(0XFF111111);
// Add other colors for dark theme as needed
}


PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
