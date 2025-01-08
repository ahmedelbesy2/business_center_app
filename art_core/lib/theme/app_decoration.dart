import 'package:art_core/theme/app_colors.dart';
import 'package:art_core/theme/styles.dart';
import 'package:flutter/material.dart';

class AppDecoration {
  static BuildContext? _context;
  static AppDecoration? _instance;

  AppDecoration._internal() {
    _instance = this;
  }

  static AppDecoration of(BuildContext context) {
    _context = context;
    return _instance ?? AppDecoration._internal();
  }

  BoxDecoration get primaryDecoration {
    return BoxDecoration(
      color: Theme.of(_context!).primaryColor,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: Theme.of(_context!).primaryColor, width: 1),
    );
  }

  // BoxDecoration get offWhiteBorderedContainer {
  //   return BoxDecoration(color: AppColors.offWhite, borderRadius: BorderRadius.circular(8));
  // }

  BoxDecoration get elevatedContainer {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: AppColors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 7,
          offset: const Offset(3, 3), // changes position of shadow
        )
      ],
    );
  }

  BoxDecoration get grayBorderContainer {
    return BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppColors.white, border: Border.all(color: AppColors.grayColor));
  }

  BoxDecoration get whiteWithUpperRoundedBorder {
    return const BoxDecoration(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      color: AppColors.white,
    );
  }

  BoxDecoration get whiteWithLowerRoundedBorder {
    return const BoxDecoration(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
      color: Color(0xFFFAFAFA),
    );
  }

  BoxDecoration get tipToDragDecoration {
    return BoxDecoration(
      color: colorBorder,
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  BoxDecoration get greyRoundedDecoration {
    return BoxDecoration(
      color: AppColors.grayColor,
      borderRadius: BorderRadius.circular(16),
    );
  }
}
