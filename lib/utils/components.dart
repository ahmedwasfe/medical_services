import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medical_services/utils/app_color.dart';
import 'package:medical_services/utils/constants.dart';

class AppWidgets {

  static Widget CustomButton({
    required String text,
    required Function() click,
    double width = 280.0,
    double height = 48.0,
    Color background = Colors.black,
    bool isUpperCase = true,
    Color textColor = Colors.white,
    double fontSize = 20.0,
    String fontfamily = Const.appFont,
    FontWeight fontWeight = FontWeight.w500,
    double radius = 24.0,
    double marginLeft = 0.0,
    Color borderColor = AppColors.lightBlack,
    double borderWidth = 1.5,
  }) =>
      Container(
        margin: EdgeInsets.only(left: marginLeft),
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: background,
            border: Border.all(color: borderColor, width: borderWidth)),
        child: MaterialButton(
          onPressed: click,
          child: Text(
            isUpperCase ? text.toUpperCase().tr : text.tr,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize.sp,
                fontFamily: fontfamily,
                fontWeight: fontWeight),
          ),
        ),
      );

  static Widget CustomAppProgress() => Center(
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          width: 20.w,
          height: 20.h,
          child: CircularProgressIndicator(
              color: HexColor(AppColors.mainColor))));

  static Widget CustomAnimationProgress() => Center(
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: 40.w,
          height: 40.h,
          child: LoadingAnimationWidget.threeArchedCircle(
              color: HexColor(AppColors.mainColor),
              size: 25.h)));
}