import 'package:art_core/art_core.dart';
import 'package:art_core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import 'app_text.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
    this.textSize,
    this.fontWeight,
  });
  final String text;

  final double? width;
  final double? height;
  final FontWeight? fontWeight;
  final GestureTapCallback onTap;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: width,
      height: height ?? 50.h,
      child: MaterialButton(
        onPressed: onTap,
        elevation: 0,
        color:  Color(0xFFE8ECED),
        shape: RoundedRectangleBorder(

            side: BorderSide(

                color: Color(0xFFE8ECED), width: 1.w, style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(25.0))),


        child: AppText(
          text: text,
          color: AppColors.black,
          fontWeight: fontWeight,
          fontSize: textSize ?? 16.sp,
        ),
      ),
    );
  }
}
