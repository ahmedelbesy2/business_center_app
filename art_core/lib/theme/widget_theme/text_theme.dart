import '../app_colors.dart';
import '../themes.dart';

class TextThemeApp {
  static TextTheme light = TextTheme(
    bodyMedium: _styleLight,
    labelMedium: _styleLight,
    headlineMedium: _styleLight,
    headlineLarge: _styleLight,
  );

  static TextTheme dark = TextTheme(
    bodyMedium: _styleDark,
    labelMedium: _styleDark,
    headlineMedium: _styleDark,
    headlineLarge: _styleDark,
  );

  static final TextStyle _styleLight = TextStyle(
    color: AppColors.black,
    // color: AppColors.secondaryColor,
    overflow: TextOverflow.ellipsis,
    fontSize: _fontSizeText(),
    // fontWeight: FontWeight.w500,
  );

  static final TextStyle _styleDark = TextStyle(
    color: AppColors.black,
    // color: AppColors.secondaryColor,
    overflow: TextOverflow.ellipsis,
    fontSize: _fontSizeText(), fontWeight: FontWeight.bold,
  );

  static double _fontSizeText() {
    double size = 14;
    return size;
  }
}
