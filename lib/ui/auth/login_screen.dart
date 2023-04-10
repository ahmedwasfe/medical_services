import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medical_services/controller/login_controller.dart';
import 'package:medical_services/routes/routes.dart';
import 'package:medical_services/utils/app_color.dart';
import 'package:medical_services/utils/app_helper.dart';
import 'package:medical_services/utils/app_text.dart';
import 'package:medical_services/utils/components.dart';
import 'package:medical_services/utils/constants.dart';

class LoginScreen extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 50.r),
                  child: Column(
                    children: [
                      AppText.medium(text: 'مرحبًا بعودتك!', fontSize: 22.sp, fontWeight: FontWeight.w600),
                      AppText.medium(text: 'للمتابعة قم بتسجيل الدخول', fontSize: 18.sp, fontWeight: FontWeight.w500),
                      SizedBox(height: 16.h),
                      Image.asset('${Const.images}login.png')
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(right: 24.r, top: 24.r, left: 24.r),
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(text: 'رقم الهاتف', fontSize: 16.sp, fontWeight: FontWeight.w500),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.phoneController,
                            keyboardType: TextInputType.phone,
                            cursorColor: AppColors.appMainColor,
                            cursorWidth: 1.3.w,
                            cursorRadius: const Radius.circular(8).r,
                            enabled: true,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: Const.appFont,
                                color: Colors.black),
                            decoration: InputDecoration(
                                hintText: '555 555 555 970+',
                                hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                helperMaxLines: 2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(8.r), bottomRight: Radius.circular(8.r)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: AppColors.appMainColor, width: 1.w),
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(8.r), bottomRight: Radius.circular(8.r)),
                                ),
                                constraints: const BoxConstraints(
                                  maxHeight: 50,
                                  minWidth: 48,
                                )),
                            validator: (phone) => AppHelper.validatePhone(phone: phone!),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), bottomLeft: Radius.circular(8.r)),
                            border: Border.all(color: Colors.black, width: 1.w)
                          ),
                          child: Image.asset('${Const.icons}flag.png',fit: BoxFit.scaleDown),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 24.r, top: 24.r, left: 24.r),
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(text: 'كلمة المرور', fontSize: 16.sp, fontWeight: FontWeight.w500),
                    SizedBox(height: 8.h),
                    GetBuilder<LoginController>(builder: (controller) => TextFormField(
                      textInputAction: TextInputAction.go,
                      controller: controller.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isVisiblePass,
                      cursorColor: AppColors.appMainColor,
                      cursorWidth: 1.3.w,
                      cursorRadius: const Radius.circular(8).r,
                      obscuringCharacter: '•',
                      enabled: true,
                      textAlignVertical: TextAlignVertical.bottom,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: Colors.black),
                      decoration: InputDecoration(
                          hintText: '••••••••'.tr,
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
                          ),
                          suffixIcon: InkWell(
                            child: Icon(controller.visiblePassIcon, color: Colors.black),
                            onTap: () => controller.visiblePassword(),
                          )),
                      validator: (password) => AppHelper.validatePassword(password: password!),
                    ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 24.r),
                alignment: Alignment.topLeft,
                child: InkWell(child: AppText.medium(text: 'نسيت كلمة المرور ؟', textDecoration: TextDecoration.underline), onTap: (){}),
              ),
              Container(
                  margin: EdgeInsets.only(top: 36.r),
                  child: AppWidgets.CustomButton(
                      text: 'تسجيل الدخول',
                      background: AppColors.appMainColor,
                      borderColor: AppColors.appMainColor,
                      click: () => controller.login(phone: controller.phoneController.text, password: controller.passwordController.text))),
              Container(
                margin: EdgeInsets.only(top: 16.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.medium(text: 'ليس لديك حساب؟ '),
                    InkWell(
                      child: AppText.medium(text: ' حساب جديد'),
                      onTap: () => Get.toNamed(Routes.register),),
                  ],
                ),
              ),
              Center(
                child: Obx(() => controller.isLoading.isTrue ? AppWidgets.CustomAnimationProgress() : Container()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
