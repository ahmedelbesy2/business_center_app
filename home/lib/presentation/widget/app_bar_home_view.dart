import 'package:art_core/art_core.dart';
import 'package:art_core/theme/app_colors.dart';
import 'package:art_core/theme/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class AppBarHomeView extends StatefulWidget {
  const AppBarHomeView({super.key});

  @override
  State<AppBarHomeView> createState() => _AppBarHomeViewState();
}

class _AppBarHomeViewState extends State<AppBarHomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorWhite,
      child: Column(
        children: [
          SizedBox(height: 60.h,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,),
            child: Row(
              //  crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Business Center',
                  style: AppTextStyle.of(context).blackBold20,
                ),
                SvgPicture.asset(
                  'assets/images/Actions.svg',
                  width: 32,
                  height: 32,
                ),
              ],
            ),
          ),
           Divider(color: colorGrey,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/PP.png',
                      width: 36,
                      height: 36,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Baghdad Box',
                      style: AppTextStyle.of(context).blackBold16,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/Vector.svg',


                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'New Store',
                      style: AppTextStyle.of(context).primaryBold16,
                    ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
