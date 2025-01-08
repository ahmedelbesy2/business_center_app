// import 'package:art_core/app_helper.dart';
// import 'package:art_core/extensions/widgets_extensions.dart';
// import 'package:art_core/theme/app_text_style.dart';
//
// import 'package:art_core/art_core.dart';
// import 'package:art_core/theme/themes.dart';
// import 'package:art_core/widgets/app_button.dart';
// import 'package:art_core/widgets/secondary_button.dart';
// import 'package:core/core.dart';
// import 'dart:io';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:easy_localization/easy_localization.dart';
// class ShowDialogCheckUpdate extends StatelessWidget {
//   ShowDialogCheckUpdate({super.key, this.isUpdateRequired});
//   bool? isUpdateRequired = false;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset(
//           "assets/driver_images/check_update.png",
//           package: "art_core",
//         ),
//         Text(
//           "update_notice".tr(),
//           style: AppTextStyle.of(context).blackBold18,
//         ).marginOnly(bottom: 8, top: 8),
//         Text(
//           "please_upgrade_your_app_for_more_features_and_better_user_experience".tr(),
//           maxLines: 2,
//           style: AppTextStyle.of(context).blackRegular16,
//           textAlign: TextAlign.center,
//         ).marginOnly(bottom: 16),
//         isUpdateRequired != false
//             ? AppButton(
//                 text: "update_now".tr(),
//                 width: double.infinity,
//                 onTap: () {
//
//                   if(Modular.get<PreferenceManager>().getAppName()=="UpRyde Rider"){
//
//                     if (Platform.isAndroid || Platform.isIOS) {
//                       final appId =
//                       Platform.isAndroid ? 'com.upryde.rider' : '6451238462';
//                       final url = Platform.isAndroid
//                           ? "market://details?id=$appId"
//                           : "https://apps.apple.com/app/id$appId";
//
//                       AppHelper.launchURL(
//                         url: url,
//                       );
//                     }
//
//                   }else {
//                     if (Platform.isAndroid || Platform.isIOS) {
//                       final appId =
//                       Platform.isAndroid ? 'com.upryde.driver' : '6451238681';
//                       final url = Platform.isAndroid
//                           ? "market://details?id=$appId"
//                           : "https://apps.apple.com/app/id$appId";
//
//                       AppHelper.launchURL(
//                         url: url,
//                       );
//                     }
//                   }
//                 },
//               )
//             : Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AppButton(
//                     text: "update_now".tr(),
//                     width: 160.w,
//                     onTap: () {
//
//                       if(Modular.get<PreferenceManager>().getAppName()=="UpRyde Rider"){
//
//                         if (Platform.isAndroid || Platform.isIOS) {
//                           final appId =
//                           Platform.isAndroid ? 'com.upryde.rider' : '6451238462';
//                           final url = Platform.isAndroid
//                               ? "market://details?id=$appId"
//                               : "https://apps.apple.com/app/id$appId";
//
//                           AppHelper.launchURL(
//                             url: url,
//                           );
//                         }
//
//                       }else {
//                         if (Platform.isAndroid || Platform.isIOS) {
//                           final appId =
//                           Platform.isAndroid ? 'com.upryde.driver' : '6451238681';
//                           final url = Platform.isAndroid
//                               ? "market://details?id=$appId"
//                               : "https://apps.apple.com/app/id$appId";
//
//                           AppHelper.launchURL(
//                             url: url,
//                           );
//                         }
//                       }
//                     },
//
//                   ),
//                    SizedBox(
//                     width: 10.w,
//                   ),
//                   SecondaryButton(
//                     onTap: () {
//                       Modular.to.pop();
//                     },
//                     text: "remind_me_later".tr(),
//                     width: 160.w,
//                   ),
//                 ],
//               ),
//       ],
//     ).marginOnly(bottom: 10, top: 10);
//   }
// }
