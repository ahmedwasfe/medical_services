import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medical_services/controller/change_password_controller.dart';
import 'package:medical_services/utils/app_color.dart';
import 'package:medical_services/utils/app_helper.dart';
import 'package:medical_services/utils/app_text.dart';
import 'package:medical_services/utils/components.dart';
import 'package:medical_services/utils/constants.dart';

class ChangePasswordScreen extends StatelessWidget {

  final _controller = Get.put(ChangePasswordController());

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
            text: 'تغيير كلمة المرور',
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
        child: Form(
          key: _controller.formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 24.r, top: 24.r, left: 24.r),
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(text: 'كلمة المرور القديمة', color: AppColors.textSubColor2, fontSize: 16.sp, fontWeight: FontWeight.w500),
                    SizedBox(height: 8.h),
                    GetBuilder<ChangePasswordController>(builder: (controller) => TextFormField(
                      textInputAction: TextInputAction.go,
                      controller: controller.oldPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isVisibleOldPass,
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
                            child: Icon(controller.visibleOldPassIcon, color: Colors.black),
                            onTap: () => controller.visibleOldPassword(),
                          )),
                      validator: (password) => AppHelper.validatePassword(password: password!),
                    ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 24.r, top: 24.r, left: 24.r),
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(text: 'كلمة السر الجديدة', color: AppColors.textSubColor2, fontSize: 16.sp, fontWeight: FontWeight.w500),
                    SizedBox(height: 8.h),
                    GetBuilder<ChangePasswordController>(builder: (controller) => TextFormField(
                      textInputAction: TextInputAction.go,
                      controller: controller.newPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isVisibleNewPass,
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
                            child: Icon(controller.visibleNewPassIcon, color: Colors.black),
                            onTap: () => controller.visibleNewPassword(),
                          )),
                      validator: (password) => AppHelper.validatePassword(password: password!),
                    ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 24.r, top: 24.r, left: 24.r),
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(text: 'تأكيد كلمة المرور', color: AppColors.textSubColor2, fontSize: 16.sp, fontWeight: FontWeight.w500),
                    SizedBox(height: 8.h),
                    GetBuilder<ChangePasswordController>(builder: (controller) => TextFormField(
                      textInputAction: TextInputAction.go,
                      controller: controller.confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isVisibleConfirmPass,
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
                            child: Icon(controller.visibleConfirmPassIcon, color: Colors.black),
                            onTap: () => controller.visibleConfirmPassword(),
                          )),
                      validator: (confirmPassword) => AppHelper.validateConfirmPassword(conformPassword: confirmPassword!, password: controller.newPasswordController.text),
                    ))
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 36.r),
                  child: AppWidgets.CustomButton(
                      text: 'تغيير كلمة المرور',
                      background: AppColors.appMainColor,
                      borderColor: AppColors.appMainColor,
                      click: () {})),
              Center(
                child: Obx(() => _controller.isLoading.isFalse ? AppWidgets.CustomAnimationProgress() : Container()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
