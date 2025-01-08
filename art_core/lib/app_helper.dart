import 'dart:io' as io;
import 'dart:io';

import 'package:art_core/art_core.dart';
import 'package:art_core/extensions/widgets_extensions.dart';
import 'package:art_core/theme/themes.dart';
import 'package:core/core.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class AppHelper {
  static showCustomToast(BuildContext context, String title, String icon, {Duration? duration, double? width}) {
    FToast? fToast;
    fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 22.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),

      // "ddfs"

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            // package: "art_core",
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: width ?? null,
            child: Text(
              title,
              maxLines: 5,
            ),
          )
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      positionedToastBuilder: (context, w,toastGravity) => Scaffold(
        backgroundColor: const Color(0xFF0F0F0F).withOpacity(0.37),
        body: toast.marginOnly(top: 100.h, left: 20, right: 20),
      ),
      gravity:  ToastGravity.CENTER,
      toastDuration: duration ?? const Duration(seconds: 1),
    );
  }

  static Future<T?> showCustomBottomSheet<T>(Widget child,
      {bool? isScrollControlled, bool? isDismissible, required BuildContext context, double? borderRadious, bool? enableDrag}) async {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
      isScrollControlled: isScrollControlled ?? true,
      context: context,
      isDismissible: isDismissible ?? true,
      enableDrag: enableDrag ?? true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadious ?? 15),
          color: Colors.white,
        ),
        // margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, top: 30),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: colorBorder,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const SizedBox(height: 4, width: 50)),
              ),
              Expanded(
                child: SingleChildScrollView(
                  primary: true,
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<T?> showDefaultBottomSheet<T>(Widget child, {bool? isScrollControlled, required BuildContext context, bool? isDismissible, bool? enableDrag}) async {
    return showModalBottomSheet(
      enableDrag: enableDrag ?? true,
      isDismissible: isDismissible ?? true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      isScrollControlled: isScrollControlled ?? true,
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => IntrinsicHeight(
        child: Column(
          children: [
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }

  static String convertArToEn(String arabicNumerals) {
    Map<String, String> arabicToStandardMap = {
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
    };
    final formatedNumber = arabicNumerals.split('').map((char) {
      return arabicToStandardMap[char] ?? char;
    }).join();
    debugPrint('formatedNumber----$formatedNumber');
    return formatedNumber;
  }

  static Future<void> launchURL({String? url}) async {
    if (await canLaunch(url!)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchWaze({double? lat, double? lng}) async {
    var url = "https://waze.com/ul?q=$lat,$lng&navigate=yes&zoom=17";
    ;
    var fallbackUrl = 'https://waze.com/ul?ll=${lat.toString()},${lng.toString()}&navigate=yes';
    try {
      bool launched = await launch(url, forceSafariVC: false, forceWebView: false);
      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  }

  static Future<void> launchGoogleMap({double? latitude, double? longitude, bool? isShow}) async {
    String googleUrlStart = "google.navigation:q=$latitude,$longitude&mode=d";
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (isShow == true) {
      if (io.Platform.isIOS) {
        if (await canLaunch(googleUrl)) {
          await launch(googleUrl);
        } else {
          if (await canLaunch(googleUrl)) {
            await launch(googleUrl);
          } else {
            throw 'Could not open the map.';
          }
        }
      } else {
        if (await canLaunch(googleUrlStart)) {
          await launch(googleUrlStart);
        } else {
          throw 'Could not open the map.';
        }
      }
    } else {
      if (io.Platform.isIOS) {
        if (await canLaunch(googleUrl)) {
          await launch(googleUrl);
        } else {
          if (await canLaunch(googleUrl)) {
            await launch(googleUrl);
          } else {
            throw 'Could not open the map.';
          }
        }
      } else {
        if (await canLaunch(googleUrl)) {
          await launch(googleUrl);
        } else {
          throw 'Could not open the map.';
        }
      }
    }
  }

  static Future<void> showLoadingDialog(
    BuildContext context,
  ) async {
    await showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: SizedBox(
            width: 100,
            height: 100,
            child: Dialog(
              backgroundColor: Colors.transparent,
              child: SizedBox(
                width: 100,
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(
                    color: colorPrimary,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Color parseColor(String hexColor) {
    // Remove the leading '#' if present
    hexColor = hexColor.replaceAll("#", "");

    // Convert the hex string to a color
    return Color(int.parse(hexColor, radix: 16));
  }

  static String convertDate(String date) {
    DateTime timestamp = DateTime.parse(date);
    String formattedDateTime = DateFormat("dd/MM/yyyy, hh:mm a").format(timestamp);
    debugPrint(formattedDateTime);
    return formattedDateTime;
  }

  static Future<String> getDeviceIdentifier() async {
    String? deviceIdentifier = "unknown";
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceIdentifier = androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceIdentifier = iosInfo.identifierForVendor;
    }
    return deviceIdentifier ?? "";
  }

  // static Future<int> getDeviceAndroidNumber() async {
  //   int? deviceAndroidNumber = 0;
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //
  //   if (Platform.isAndroid) {
  //     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //     deviceAndroidNumber = int.parse(androidInfo.version.release);
  //     Modular.get<PreferenceManager>().setDeviceAndroidNumber(deviceAndroidNumber);
  //   }
  //
  //   return deviceAndroidNumber ?? 0;
  // }

  static Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return version;
  }
  //
  // static Future<String> getAppName() async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   String appName = packageInfo.appName;
  //   Modular.get<PreferenceManager>().setAppName(appName);
  //   debugPrint("AppName===>>> $appName");
  //   return appName;
  // }


  static replaceFarsiNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠','١','٢','٣','٤','٥','٦','٧','٨','٩'];

    for (int i = 0; i < arabic.length; i++) {
      input = input.replaceAll(arabic[i], english[i]);
    }

    return input;
  }



  static extractLatLng({required String url}) {
    debugPrint('url ========= $url');
    final uri = Uri.parse(url);
    final latLng = uri.pathSegments.firstWhere((segment) => segment.contains('@')).split('@').last.split(',');

    final latitude = double.parse(latLng[0]);
    final longitude = double.parse(latLng[1]);

    debugPrint('Latitude: $latitude');
    debugPrint('Longitude: $longitude');
  }

  static String formatDateToDayAndWeek(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);

    // Get the day of the week

    String dayOfWeek = DateFormat('EEEE', PreferenceManager().currentLang()).format(dateTime);

    // Get the day and month
    String dayMonth = DateFormat('d/M', PreferenceManager().currentLang()).format(dateTime);

    // Get the hour and minute in 12-hour format
    String hourMinute = DateFormat('h:mma', PreferenceManager().currentLang()).format(dateTime).toLowerCase();

    // Combine all parts
    String formattedDate = '$dayOfWeek $dayMonth , ${'moving'.tr()} $hourMinute';

    return formattedDate;
  }

  static final Map<int, String> daysOfWeek = {
    3: 'monday',
    4: 'tuesday',
    5: 'wednesday',
    6: 'thursday',
    7: 'friday',
    1: 'saturday',
    2: 'sunday',
  };

  static List<String> getDays(
    List<int> numbers,
  ) {
    List<String> days = [];
    for (int number in numbers) {
      if (daysOfWeek.containsKey(number)) {
        days.add(daysOfWeek[number]!);
      }
    }
    return days;
  }

  static List<DateItem> generateFormattedDateList() {
    List<DateItem> formattedDateList = [];
    DateTime now = DateTime.now();
    DateFormat humanReadableFormat = DateFormat('E, dd MMM', PreferenceManager().currentLang());
    DateFormat isoFormat = DateFormat('yyyy-MM-dd', "en");

    for (int i = 0; i < 7; i++) {
      DateTime date = now.add(Duration(days: i));
      String humanReadable;
      if (i == 0) {
        humanReadable = "today".tr();
      } else if (i == 1) {
        humanReadable = "tomorrow".tr();
      } else {
        humanReadable = humanReadableFormat.format(date);
      }
      formattedDateList.add(DateItem(humanReadable, isoFormat.format(date)));
    }
    return formattedDateList;
  }

  static String timeAgo(int minutes) {
    if (minutes < 60) {
      return '$minutes min ago';
    } else if (minutes < 1440) {
      int hours = minutes ~/ 60;
      return '$hours hour${hours > 1 ? 's' : ''} ago';
    } else {
      int days = minutes ~/ 1440;
      return '$days day${days > 1 ? 's' : ''} ago';
    }
  }

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}

class DateItem {
  final String humanReadable;
  final String isoFormat;

  DateItem(this.humanReadable, this.isoFormat);
}
