import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medical_services/controller/splash_controller.dart';
import 'package:medical_services/utils/app_helper.dart';
import 'package:medical_services/utils/constants.dart';

class SplashScreen extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    AppHelper.statusBarColor();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('${Const.images}app_logo.png',
            height: 180.h,
            width: 180.w,)),
        ],
      ),
    );
  }
}
