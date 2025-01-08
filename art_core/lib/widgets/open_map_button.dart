import 'package:art_core/theme/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/styles.dart';

class OpenMapButton extends StatelessWidget {
  const OpenMapButton({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/driver_images/noun-pin-1051168.svg",
              package: 'art_core',
            ),
            SizedBox(width: 8.w),
            Text(
              'pin_location_on_map'.tr(),
              style: AppTextStyle.of(context).blackRegular16.copyWith(color:colorPrimary),
            )
          ],
        ),
      ),
    );
  }
}
