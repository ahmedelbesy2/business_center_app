import 'package:flutter/services.dart';

import '../app_colors.dart';
import '../themes.dart';

class AppBarThemes {
  static AppBarTheme light = AppBarTheme(
    backgroundColor: AppColors.white,
    shadowColor: AppColors.primaryColorLight.withOpacity(0.2),
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: AppColors.black,
      size: 20,
    ),
    actionsIconTheme: const IconThemeData(
      color: AppColors.black,
      size: 24,
    ),
    elevation: 2.0,
    titleTextStyle: const TextStyle(
      color: AppColors.black,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
  );

  static AppBarTheme dark = AppBarTheme(
    backgroundColor: AppColors.black,
    shadowColor: AppColors.black.withOpacity(0.2),
    elevation: 2.0,
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: AppColors.iconDark,
      size: 20,
    ),
    actionsIconTheme: const IconThemeData(
      color: AppColors.iconDark,
      size: 24,
    ),
    titleTextStyle: const TextStyle(
      color: AppColors.primaryColorTextDark,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
  );
}
