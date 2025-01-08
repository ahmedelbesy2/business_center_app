import 'package:art_core/widgets/app_button.dart';
import 'package:art_core/widgets/app_text.dart';
import 'package:art_core/widgets/secondary_button.dart';
import 'package:core/core.dart';

import '../art_core.dart';
import '../theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


showDialogApp( {double? height, bool dismissible = true,BuildContext ?context, Color ?backgroundColor, Widget?widget,}) {
  AlertDialog alert = AlertDialog(
    insetPadding: EdgeInsets.zero,
    contentPadding: EdgeInsets.zero,
    content: Container(
      height: height,
width: double.infinity,
      alignment: Alignment.center,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      padding: const EdgeInsets.all(20),
      child: widget,
    ),
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    backgroundColor: Colors.white,
  );

  showDialog(
    barrierDismissible: dismissible,
    context: context!,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



showAlarmDialogApp( {double? height, bool dismissible = true,BuildContext ?context, String ?title,String ?titleButtonYes,String ?titleButtonNo,GestureTapCallback ?onTapButtonYes,Widget ?child}) {
  AlertDialog alert = AlertDialog(
    backgroundColor:AppColors.white ,
    insetPadding: const EdgeInsets.all(20),
    elevation: 0,
    content: SizedBox(
      width: double.infinity,
      height: height,
      child: child ?? Container(

        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            AppText(text: title!,maxLines: 3,textAlign: TextAlign.center,fontSize: 18.sp,fontWeight: FontWeight.w700,),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SecondaryButton(onTap: onTapButtonYes!,text:titleButtonYes??"yes".tr(),textSize: 16.sp,width: 150.w),

                const SizedBox(
                  width: 20,
                ),
                AppButton(text: titleButtonNo?? "no".tr(),
                  onTap: (){
                  Modular.to.pop();

                  },textSize: 16.sp,width: 150.w,),
              ],
            )
          ],
        ),
      ),
    ),
  );
  showDialog(
    barrierDismissible: dismissible,
    context: context!,
    builder: (BuildContext context) {
      return alert;
    },
  );
}