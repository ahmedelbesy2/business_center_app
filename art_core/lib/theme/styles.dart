import 'package:flutter/material.dart';

var colorBlack = const Color(0xFF14171A);
var colorWhite = const Color(0xFFffffff);
var colorDarkGrey = const Color(0xFF828D9C);
var colorGrey = const Color(0xFFF1F2F6);
var colorRed= const Color(0xFFC1121F);
var colorGreen = const Color(0xFF278300);
var colorLightGreen = const Color(0xFFE8F5EB);
var colorBorder = const Color(0xFFCED8DC);
var colorPrimary = const Color(0xFF1C76BC);
var colorSecondary = const Color(0xFFC1121F).withOpacity(.5);
var iconColor = const Color(0xFF7E94A0);
var colorTitle = const Color(0xFF000000);






Color mC = Colors.grey.shade100;
Color mCL = Colors.white;
Color mCM = Colors.grey.shade200;
Color mCH = Colors.grey.shade400;
Color mCD = Colors.black.withOpacity(0.075);
Color mCC = Colors.green.withOpacity(0.65);
Color fCD = Colors.grey.shade700;
Color fCL = Colors.grey;

BoxDecoration nMbox = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  color: mC,
  boxShadow: [
    BoxShadow(
      color: mCD,
      offset: const Offset(10, 10),
      blurRadius: 10,
    ),
    BoxShadow(
      color: mCL,
      offset: const Offset(-10, -10),
      blurRadius: 10,
    ),
  ],
);

BoxDecoration nMboxCategoryOff = BoxDecoration(
  shape: BoxShape.circle,
  color: mC,
  boxShadow: [
    BoxShadow(
      color: mCD,
      offset: const Offset(10, 10),
      blurRadius: 10,
    ),
    BoxShadow(
      color: mCL,
      offset: const Offset(-10, -10),
      blurRadius: 10,
    ),
  ],
);

BoxDecoration nMboxCategoryOn = BoxDecoration(
  shape: BoxShape.circle,
  color: mCD,
  boxShadow: [
    BoxShadow(color: mCL, offset: const Offset(3, 3), blurRadius: 3, spreadRadius: -3),
  ],
);
BoxDecoration mainDecoration = BoxDecoration(borderRadius: BorderRadius.circular(5), color: colorWhite);

BoxDecoration nMboxInvert = BoxDecoration(borderRadius: BorderRadius.circular(15), color: mCD, boxShadow: [
  BoxShadow(color: mCL, offset: const Offset(3, 3), blurRadius: 3, spreadRadius: -3),
]);

BoxDecoration nMboxInvertActive = nMboxInvert.copyWith(color: mCC);

BoxDecoration nMbtn = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: mC,
  boxShadow: [
    BoxShadow(
      color: mCD,
      offset: const Offset(2, 2),
      blurRadius: 2,
    )
  ],
);

BoxDecoration gradiantDecoration(
    {double topLeftRadius = 5,
    double topRightRadius = 5,
    double bottomLeftRadius = 5,
    double bottomRightRadius = 5,
    bool circle = false}) {
  return circle
      ?   const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              colors: [Color(0xff253D52), Color(0xff156B73), Color(0xff08918F)],
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd),
        )
      : BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius),
              topRight: Radius.circular(topRightRadius),
              bottomLeft: Radius.circular(bottomLeftRadius),
              bottomRight: Radius.circular(bottomRightRadius)),
          gradient: const LinearGradient(
              colors: [Color(0xff253D52), Color(0xff156B73), Color(0xff08918F)],
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd),
        );
}
