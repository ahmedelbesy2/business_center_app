import 'package:art_core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../art_core.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
     this.text,
    this.onTap,
    this.width,
    this.height,
    this.textSize,
    this.fontWeight,
    this.color, this.widget,
  });

  final String ?text;
  final Color? color;
  final double? width;
  final double? height;
  final FontWeight? fontWeight;
  final GestureTapCallback? onTap;
  final double? textSize;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: width,
      height: height ?? 50.h,
      child: MaterialButton(
        onPressed: onTap,

        elevation: 0,
        color: color ?? AppColors.primaryColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child:widget?? AppText(
          text: text??"",
          color: colorWhite,
          fontWeight: fontWeight??FontWeight. bold,
          fontSize: textSize ?? 17.sp,
          maxLines: 2,

        ),

      ),
    );
  }

}
