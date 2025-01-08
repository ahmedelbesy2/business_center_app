import 'dart:io';

import 'package:art_core/art_core.dart';
import 'package:art_core/extensions/widgets_extensions.dart';
import 'package:art_core/image_helper.dart';
import 'package:art_core/theme/app_text_style.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key, required this.onPick});

  final Function(File?) onPick;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () async {
            Modular.to.pop();
            final img = await ImageHelper.i.pickImage(type: PickType.camera);
            onPick(img);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/saboba_images/camera.svg', package: 'art_core',color: AppColors.iconColor,),
              SizedBox(width: 8.w),
              Text('take_a_photo'.tr(), style: AppTextStyle.of(context).blackRegular16),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        InkWell(
          onTap: () async {
            Modular.to.pop();

            final img = await ImageHelper.i.pickImage(type: PickType.gallery);
            onPick(img);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/saboba_images/gallery.svg', package: 'art_core',color: AppColors.iconColor,),
              SizedBox(width: 8.w),
              Text('select_from_gallary'.tr(), style: AppTextStyle.of(context).blackRegular16),
            ],
          ),
        ),
      ],
    ).marginSymmetric(vertical: 25.h);
  }
}
