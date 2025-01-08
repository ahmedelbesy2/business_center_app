// import 'dart:async';
// import 'package:core/core.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/cupertino.dart';
//
// class DriverFireBaseDynamicLinkHelper {
//   final String uriPrefix = "https://share.upryde.com.eg";
//   final String fullLink = "https://share.upryde.com.eg/DriverReferrer?driver=";
//   FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
//   Future<void> initDynamicLinks() async {
//     dynamicLinks.getInitialLink().then((value) => {
//           if (value != null)
//             {
//               Modular.get<PreferenceManager>().setReferralCode(value.link.queryParameters["driver"].toString()),
//             }
//         });
//     dynamicLinks.onLink.listen((dynamicLinkData) {
//       final Uri uri = dynamicLinkData.link;
//       final queryParams = uri.queryParameters;
//       if (queryParams.isNotEmpty) {
//         String? driverReferralCode = queryParams["driver"];
//         debugPrint("codeeeeeeeeeeeeeeeeeeeeeeee $driverReferralCode");
//       } else {}
//     }).onError((error) {
//       debugPrint('onLink error');
//       debugPrint(error.message);
//     });
//   }
//
//   Future<String> createDynamicLink(String link) async {
//     final DynamicLinkParameters parameters = DynamicLinkParameters(
//         uriPrefix: uriPrefix,
//         link: Uri.parse(fullLink + link),
//         androidParameters: const AndroidParameters(
//           packageName: 'com.upryde.driver',
//           minimumVersion: 0,
//         ),
//         iosParameters: const IOSParameters(
//           bundleId: 'com.upryde.driver',
//           appStoreId: "6451238681",
//           minimumVersion: "0",
//         ),
//         socialMetaTagParameters: SocialMetaTagParameters(
//             description:
//                 "انضم لتطبيق أب رايد و اكسب خصومات على رحلاتك لما تسجل عن طريق اللينك الخاص بـ  ""}, و استمتع برحلات آمنة بأحسن سعر",
//             title: "أب رايد-رحلات آمنة بأحسن سعر",
//             imageUrl: Uri.parse("https://uprydestorage.blob.core.windows.net/uprydestorage/WhatsAppImage2023-12-30at20.20.21_0a9aca8b.jpg")));
//
//     Uri url;
//
//     if (true) {
//       final ShortDynamicLink shortLink = await dynamicLinks.buildShortLink(
//         parameters,
//         shortLinkType: ShortDynamicLinkType.unguessable,
//       );
//       url = shortLink.shortUrl;
//     } else {
//       url = await dynamicLinks.buildLink(parameters);
//     }
//     return "${url.toString()} \nانضم لتطبيق أب رايد و اكسب خصومات \nعلى رحلاتك لما تسجل عن طريق اللينك \n,و استمتع برحلات آمنة بأحسن سعر.\n";
//   }
// }
