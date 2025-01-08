import 'package:art_core/art_core.dart';
import 'package:art_core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class StepperBar extends StatelessWidget {
   StepperBar({super.key, this.statusIndex = 1});
  int statusIndex;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Step 1
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor:Colors.grey.shade300,

                child: CircleAvatar(

                  radius: 14,
                  backgroundColor: statusIndex == 1 ?colorPrimary:colorWhite,
                  child: Text(
                    '١',
                    style: statusIndex == 1 ? AppTextStyle.of(context).blackBold16.copyWith(fontSize: 13,color: colorWhite) : AppTextStyle.of(context).blackBold16.copyWith(color: Colors.grey,fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'تفاصيل الحساب',
                style: statusIndex == 1 ? AppTextStyle.of(context).blackBold16.copyWith(fontSize: 13,color: colorPrimary) : AppTextStyle.of(context).blackBold16.copyWith(color: Colors.grey,fontSize: 13),
              ),
            ],
          ),
          const SizedBox(width: 10),

          // Step 2
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor:Colors.grey.shade300,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: statusIndex == 2 ?colorPrimary:colorWhite,
                  child:  Text(
                    '٢',
                    style: statusIndex == 2 ? AppTextStyle.of(context).blackBold16.copyWith(fontSize: 13,color: colorWhite) : AppTextStyle.of(context).blackBold16.copyWith(color: Colors.grey,fontSize: 13),

                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'معلومات التاجر',
                style: statusIndex == 2 ? AppTextStyle.of(context).blackBold16.copyWith(fontSize: 13,color: colorPrimary) : AppTextStyle.of(context).blackBold16.copyWith(color: Colors.grey,fontSize: 13),

              ),
            ],
          ),
          const SizedBox(width: 10),

          // Step 3
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor:Colors.grey.shade300,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: statusIndex == 3 ?colorPrimary:colorWhite,
                  child:  Text(
                    '٣',
                    style: statusIndex == 3 ? AppTextStyle.of(context).blackBold16.copyWith(fontSize: 13,color: colorWhite) : AppTextStyle.of(context).blackBold16.copyWith(color: Colors.grey,fontSize: 13),

                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'تحميل الملفات',
                style: statusIndex == 3 ? AppTextStyle.of(context).blackBold16.copyWith(fontSize: 13,color: colorPrimary) : AppTextStyle.of(context).blackBold16.copyWith(color: Colors.grey,fontSize: 13),

              ),
            ],
          ),
        ],
      ),
    );
  }
}
