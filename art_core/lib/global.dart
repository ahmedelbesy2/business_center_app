// ignore_for_file: unnecessary_null_comparison
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

class global {
  static var PrimaryColor = Color(0xFF0094CD);
  static var font = "";
  static var font_color = "";
  static var appVersion = 6.0;
  static Future<String> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? '';
  }

  static Future<String> setUserName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', value);
    return 'done';
  }

  static showAlert(mess, context) {
    AlertDialog alert = AlertDialog(
      content: Text(mess),
      actions: [
        TextButton(
          child: Text("ok".tr(), textAlign: TextAlign.justify),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static phone07(value) {
    if ((value != null) && (value.startsWith("07") || value.startsWith("٠٧"))) {
      return false;
    } else if (value == null || value == '') {
      return false;
    } else {
      return true;
    }
  }

  static moneyDontEqual999(value) {
    if ((value != null) &&
        (value != '') &&
        int.parse(value) < 1000 &&
        int.parse(value) > 0) {
      return true;
    } else if (value == null || value == '') {
      return false;
    } else {
      return false;
    }
  }

  static showLottieDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => Material(
        type: MaterialType.transparency,
        child: Center(
          child: Lottie.asset(
            'assets/lottie/Comp 2.json',
            width: MediaQuery.of(context).size.width / 3,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
    Timer(Duration(seconds: 3), () {
      Navigator.pop(context);
    });
  }

  static String replaceArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(arabic[i], english[i]);
    }
    return input;
  }

  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  static setMaxString(value, max) {
    if (value.length > max) {
      return (value.substring(0, max)).replaceAll("\n", " ");
    } else {
      return value.replaceAll("\n", " ");
    }
  }

  static bool isNumeric2(String str) {
    try {
      var value = int.parse(str);
      return true;
    } on FormatException {
      return false;
    }
  }

  static numberPrice(number) {
    if (number != '') {
      return NumberFormat.decimalPattern("uk-UA")
          .format(int.parse(number))
          .toString();
    } else {
      return '';
    }
  }
}
