import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medical_services/controller/settings_controller.dart';
import 'package:medical_services/utils/app_text.dart';

class PrivacyScreen extends StatelessWidget {

  final _controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: AppText.larg(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            text: 'سياسة الخصوصية',
            color: Colors.black),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: InkWell(
            onTap: () => Navigator.maybePop(context),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30.r, right: 20.r, left: 20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.medium(text: '1. أنواع البيانات التي نجمعها', fontSize: 18.sp, fontWeight: FontWeight.w400),
                  SizedBox(height: 16.h),
                  AppText.medium(text: '${_controller.text}', maxline: 10, fontSize: 14.sp, fontWeight: FontWeight.w400),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50.r, right: 20.r, left: 20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.medium(text: '2. استخدام بياناتك الشخصية', fontSize: 18.sp, fontWeight: FontWeight.w400),
                  SizedBox(height: 16.h),
                  AppText.medium(text: '${_controller.text}', maxline: 10, fontSize: 14.sp, fontWeight: FontWeight.w400),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50.r, right: 20.r, left: 20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.medium(text: '3. الإفصاح عن بياناتك الشخصية', fontSize: 18.sp, fontWeight: FontWeight.w400),
                  SizedBox(height: 16.h),
                  AppText.medium(text: '${_controller.text}', maxline: 10, fontSize: 14.sp, fontWeight: FontWeight.w400),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
