import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medical_services/controller/settings_controller.dart';
import 'package:medical_services/utils/app_color.dart';
import 'package:medical_services/utils/app_text.dart';
import 'package:medical_services/utils/components.dart';
import 'package:medical_services/utils/constants.dart';

class ContactUsScreen extends StatelessWidget {

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
            text: 'تواصل معنا',
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
              margin: EdgeInsets.only(right: 24.r, top: 30.r, left: 24.r),
              alignment: Alignment.topRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.medium(text: 'الاسم كاملاً', fontSize: 16.sp, fontWeight: FontWeight.w500),
                  SizedBox(height: 8.h),
                  TextFormField(
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.text,
                    cursorColor: AppColors.appMainColor,
                    cursorWidth: 1.3.w,
                    cursorRadius: const Radius.circular(8).r,
                    enabled: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'اكتب اسم المستخدم الخاص بك',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.h,
                            fontFamily: Const.appFont,
                            fontWeight: FontWeight.w400
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        helperMaxLines: 2,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: AppColors.appMainColor, width: 1.w),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        constraints: const BoxConstraints(
                          maxHeight: 50,
                          minWidth: 48,
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 24.r, top: 20.r, left: 24.r),
              alignment: Alignment.topRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.medium(text: 'البريد الإلكتروني', fontSize: 16.sp, fontWeight: FontWeight.w500),
                  SizedBox(height: 8.h),
                  TextFormField(
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: AppColors.appMainColor,
                    cursorWidth: 1.3.w,
                    cursorRadius: const Radius.circular(8).r,
                    enabled: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'example@example.com',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.h,
                            fontFamily: Const.appFont,
                            fontWeight: FontWeight.w400
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        helperMaxLines: 2,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: AppColors.appMainColor, width: 1.w),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        constraints: const BoxConstraints(
                          maxHeight: 50,
                          minWidth: 48,
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 24.r, top: 20.r, left: 24.r),
              alignment: Alignment.topRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.medium(text: 'العنوان', fontSize: 16.sp, fontWeight: FontWeight.w500),
                  SizedBox(height: 8.h),
                  TextFormField(
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.streetAddress,
                    cursorColor: AppColors.appMainColor,
                    cursorWidth: 1.3.w,
                    cursorRadius: const Radius.circular(8).r,
                    enabled: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'نابلس - فلسطين',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.h,
                            fontFamily: Const.appFont,
                            fontWeight: FontWeight.w400
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        helperMaxLines: 2,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: AppColors.appMainColor, width: 1.w),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        constraints: const BoxConstraints(
                          maxHeight: 50,
                          minWidth: 48,
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 24.r, top: 20.r, left: 24.r),
              alignment: Alignment.topRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AppText.medium(text: 'الرسالة', fontSize: 16.sp, fontWeight: FontWeight.w500),
                      AppText.medium(text: ' (عدد الأحرف لا يزيد عن 300 حرف)', color: AppColors.textSubColor2, fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  TextFormField(
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.multiline,
                    cursorColor: AppColors.appMainColor,
                    maxLines: 5,
                    cursorWidth: 1.3.w,
                    cursorRadius: const Radius.circular(8).r,
                    enabled: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'اكتب رسالتك هنا ......',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.h,
                            fontFamily: Const.appFont,
                            fontWeight: FontWeight.w400
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        helperMaxLines: 2,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: AppColors.appMainColor, width: 1.w),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        constraints: const BoxConstraints(
                          maxHeight: 343,
                          minWidth: 48,
                        )),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 36.r),
                child: AppWidgets.CustomButton(
                    text: 'إرسال',
                    background: AppColors.appMainColor,
                    borderColor: AppColors.appMainColor,
                    click: () {})),
            Center(
              child: Obx(() => _controller.isLoading.isFalse ? AppWidgets.CustomAnimationProgress() : Container()),
            ),
          ],
        ),
      ),
    );
  }
}
