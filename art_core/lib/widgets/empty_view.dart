import 'package:art_core/extensions/widgets_extensions.dart';
import 'package:art_core/theme/app_text_style.dart';
import '../art_core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyView extends StatelessWidget {
   EmptyView({super.key,this.image,this.tittle});
  String? image;
  String ?tittle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
   crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image??"",package: "art_core",).marginOnly(bottom: 16.h),
          Text(tittle??"",style: AppTextStyle.of(context).blackBold18,)
        ],
      ),
    );
  }
}
