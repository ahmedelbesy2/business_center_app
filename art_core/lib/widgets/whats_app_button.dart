// import 'package:art_core/theme/app_text_style.dart';
// import 'package:core/core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';
// import 'package:easy_localization/easy_localization.dart'hide TextDirection;
//
// class WhatsAppButton extends StatelessWidget {
//   const WhatsAppButton({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () async{
//         await launchUrlString(
//           "${Modular.get<PreferenceManager>().checkUpdateEntity().supportUrl}",
//           mode: LaunchMode.externalApplication,
//         );
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             height: 40,
//             width: 150,
//             margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
//             alignment: Alignment.center,
//           decoration: BoxDecoration(
//               color: Colors.grey.shade50,
//               borderRadius: BorderRadius.circular(10),
//
//               boxShadow: [
//                 BoxShadow(
//                   color:  Colors.black.withOpacity(0.16),
//                   blurRadius: 16,
//                 ),
//               ]
//           ),
//             child: Text(
//               "hi_how_can_i_help_you".tr(),style: AppTextStyle.of(context).blackRegular14.copyWith(fontSize: 10),
//
//             ),
//           ),
//           SvgPicture.asset("assets/saboba_images/whats_app_icon.svg",package: "art_core",),
//         ],
//       ),
//     );
//   }
// }
