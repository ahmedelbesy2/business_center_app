import 'package:art_core/theme/app_colors.dart';
import 'package:art_core/theme/themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static BuildContext? _context;
  static AppTextStyle? _instance;

  AppTextStyle._internal() {
    _instance = this;
  }

  static AppTextStyle of(BuildContext context) {
    _context = context;
    return _instance ?? AppTextStyle._internal();
  }

  String get fontFamily => 'IBMPlexSansArabic';

  //Getters
  TextStyle get blackRegular16 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.black : AppColors.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamily,
      package: 'art_core',
      locale: const Locale('en'),
    );
  }

  TextStyle get blackRegular14 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.black : AppColors.white,
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamily,
      package: 'art_core',
      locale: const Locale('en'),
    );
  }

  TextStyle get whiteBold32 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.white : AppColors.white,
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
      package: 'art_core',
      locale: const Locale('en'),
    );
  }

  TextStyle get whiteRegular18 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.white : AppColors.white,
      fontSize: 18.sp,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamily,
      package: 'art_core',
      locale: const Locale('en'),
    );
  }

  TextStyle get greyRegular14 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? colorBorder : AppColors.white,
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamily,
      package: 'art_core',
      locale: const Locale('en'),
    );
  }

  TextStyle get primaryRegular14 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.primaryColor : AppColors.white,
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamily,
      package: 'art_core',
      locale: const Locale('en'),
    );
  }

  TextStyle get primaryBold14 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.primaryColor : AppColors.white,
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
      package: 'art_core',
      locale: const Locale('en'),
    );
  }

  TextStyle get primaryRegular16 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.primaryColor : AppColors.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamily,
      package: 'art_core',
      locale: const Locale('en'),
    );
  }

  TextStyle get primaryBold16 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.primaryColor : AppColors.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
      package: 'art_core',
      locale: const Locale('en'),
    );
  }

  TextStyle get primaryRegular18 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.primaryColor : AppColors.white,
      fontSize: 18.sp,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamily,
      package: 'art_core',
      locale: const Locale('en'),
    );
  }

  TextStyle get primaryBold18 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.primaryColor : AppColors.white,
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
      package: 'art_core',
      locale: const Locale('en'),
    );
  }

  TextStyle get primaryRegular20 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.primaryColor : AppColors.white,
      fontSize: 20.sp,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamily,
      package: 'art_core',
      locale: const Locale('en'),
    );
  }

  TextStyle get primaryBold20 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.primaryColor : AppColors.white,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
      package: 'art_core',
      locale: const Locale('en'),
    );
  }

  TextStyle get primaryBold24 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.primaryColor : AppColors.white,
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
      package: 'art_core',
      locale: const Locale('en'),
    );
  }

  TextStyle get whiteBold12 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.white : AppColors.black,
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
      package: 'art_core',
      locale: const Locale('en'),
    );
  }

  TextStyle get primaryBold12 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.primaryColor : AppColors.black,
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
      package: 'art_core',
      locale: const Locale('en'),
    );
  }

  TextStyle get blackBold16 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.black : AppColors.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      package: 'art_core',
      fontFamily: fontFamily,
    );
  }
  TextStyle get blackBold14 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.black : AppColors.white,
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      package: 'art_core',
      fontFamily: fontFamily,
    );
  }
  TextStyle get redBold16 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.primaryColor : AppColors.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      package: 'art_core',
      fontFamily: fontFamily,
    );
  }

  TextStyle get redBold18 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.primaryColor : AppColors.white,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      package: 'art_core',
      fontFamily: fontFamily,
    );
  }

  TextStyle get redRegular18 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.primaryColor : AppColors.white,
      fontSize: 18.sp,
      fontWeight: FontWeight.normal,
      package: 'art_core',
      fontFamily: fontFamily,
    );
  }

  TextStyle get blackBold24 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.black : AppColors.white,
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      package: 'art_core',
      fontFamily: fontFamily,
    );
  }

  TextStyle get blackBold20 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.black : AppColors.white,
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      package: 'art_core',
      fontFamily: fontFamily,
    );
  }

  TextStyle get blackBold18 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.black : AppColors.white,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      package: 'art_core',
      fontFamily: fontFamily,
    );
  }

  TextStyle get blackregular18 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? AppColors.black : AppColors.white,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      package: 'art_core',
      fontFamily: fontFamily,
    );
  }
}
