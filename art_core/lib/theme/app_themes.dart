import 'package:art_core/theme/widget_theme/app_bar_theme.dart';
import 'package:art_core/theme/widget_theme/app_button_themes.dart';
import 'package:art_core/theme/widget_theme/app_elevated_button_themes.dart';
import 'package:art_core/theme/widget_theme/app_floating_button_themes.dart';
import 'package:art_core/theme/widget_theme/app_switch_themes.dart';
import 'package:art_core/theme/widget_theme/text_field_themes.dart';
import 'package:art_core/theme/widget_theme/text_theme.dart';
import 'package:flutter/material.dart';

enum AppTheme { light, dark }

final appThemeData = {
  AppTheme.light: AppThemes.light,
  AppTheme.dark: AppThemes.dark,
};

class AppThemes {
  static ThemeData light = ThemeData(
      primaryColor: Colors.black,
      appBarTheme: AppBarThemes.light,
      scaffoldBackgroundColor: Colors.white,
      buttonTheme: AppButtonThemes.light,
      elevatedButtonTheme: AppElevatedButtonThemes.light,
      floatingActionButtonTheme: AppFloatingButtonThemes.light,
      inputDecorationTheme: TextFieldThemes.light,
      switchTheme: AppSwitchThemes.light,
      textTheme: TextThemeApp.light,
      package: 'art_core',
      fontFamily: 'HelveticaNeue');

  static ThemeData dark = ThemeData(
      primaryColor: Colors.white,
      appBarTheme: AppBarThemes.dark,
      scaffoldBackgroundColor: Colors.black,
      buttonTheme: AppButtonThemes.dark,
      elevatedButtonTheme: AppElevatedButtonThemes.dark,
      floatingActionButtonTheme: AppFloatingButtonThemes.dark,
      inputDecorationTheme: TextFieldThemes.dark,
      switchTheme: AppSwitchThemes.dark,
      textTheme: TextThemeApp.dark,
      package: 'art_core',
      fontFamily: 'HelveticaNeue');

  static ThemeMode themeMode() {
    return ThemeMode.light;
    // ThemeEnum themeEnum = GlobalLocal.getAppTheme();

    // if (themeEnum == ThemeEnum.dark) {
    //   return ThemeMode.dark;
    // } else {
    //   return ThemeMode.light;
    // }
  }
}
