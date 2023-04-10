import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medical_services/controller/register_controller.dart';
import 'package:medical_services/routes/routes.dart';
import 'package:medical_services/utils/app_color.dart';
import 'package:medical_services/utils/app_helper.dart';
import 'package:medical_services/utils/app_text.dart';
import 'package:medical_services/utils/components.dart';
import 'package:medical_services/utils/constants.dart';

class RegisterScreen extends GetView<RegisterController> {

  final _controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 80.r),
                  child: Column(
                    children: [
                      AppText.medium(text: 'إنشاء حساب', fontSize: 22.sp, fontWeight: FontWeight.w600),
                      AppText.medium(text: 'يرجى ملء ملئ الحقول لإنشاء الحساب!', fontSize: 18.sp, fontWeight: FontWeight.w500),
                      SizedBox(height: 24.h),
                      InkWell(
                        child: GetBuilder<RegisterController>(builder: (controller) => Container(
                          height: 80.h,
                          width: 80.w,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r)
                          ),
                          child: _controller.userImage == null
                              ? Image.asset('${Const.images}select_image.png')
                              : Image.file(File(controller.userImage!.path), fit: BoxFit.cover,),
                        )),
                        onTap: () => controller.requestStoragePermission(),
                      )
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(right: 24.r, top: 24.r, left: 24.r),
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(text: 'الاسم كاملاً', fontSize: 16.sp, fontWeight: FontWeight.w500),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: _controller.nameController,
                      keyboardType: TextInputType.text,
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
                          hintText: 'الرجاء كتابة الاسم كاملاً (الاسم الأول واسم العائلة)',
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
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: AppColors.appMainColor, width: 1.w),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          constraints: const BoxConstraints(
                            maxHeight: 50,
                            minWidth: 48,
                          )),
                      validator: (name) => AppHelper.validateUserName(name: name!),
                    )

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 24.r, top: 24.r, left: 24.r),
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(text: 'المؤسسةً', fontSize: 16.sp, fontWeight: FontWeight.w500),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: _controller.enterpriseController,
                      keyboardType: TextInputType.text,
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
                          hintText: 'الرجاء كتابة اسم المؤسسة هنا .....',
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
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: AppColors.appMainColor, width: 1.w),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          constraints: const BoxConstraints(
                            maxHeight: 50,
                            minWidth: 48,
                          )),
                      validator: (name) => AppHelper.validateUserName(name: name!),
                    )

                  ],
                ),
              ),
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
                            controller: _controller.phoneController,
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
                          child: Image.asset('${Const.icons}flag.png',fit: BoxFit.scaleDown,),
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
                    AppText.medium(text: 'المدينة', fontSize: 16.sp, fontWeight: FontWeight.w500),
                    SizedBox(height: 8.h),
                    GetBuilder<RegisterController>(builder: (controller) => SizedBox(
                      width: 343.w,
                      height: 55.h,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: [
                              SizedBox(
                                width: 4.w,),
                              Expanded(
                                child:
                                Obx(() => Text(
                                  controller.citySelected!.value != null
                                      ? controller.citySelected!.value.tr
                                      : ''.tr,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightBlack,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ),
                            ],
                          ),
                          items: controller.listCities
                              .map((item) => DropdownMenuItem<String>(
                            value: item.toString(),
                            child: AppText.medium(text:
                            item.tr,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.appMainColor,
                            ),
                          )).toList(),
                          onChanged: (value) {
                            controller.citySelected!.value = value.toString();

                            // country = value as Section;
                            // controller.categorySelected.value = country.name!;
                            // controller.categoryId.value = country.id!;
                            //
                            // print("COUNTRY: ${country.name}");
                            // print("COUNTRY: ${country.id}");
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 24,
                            color: AppColors.appMainColor,
                          ),
                          iconSize: 14.sp,
                          iconEnabledColor: Colors.white,
                          iconDisabledColor: Colors.white,
                          buttonHeight: 100.h,
                          buttonWidth: 160.w,
                          buttonPadding:
                          const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.appMainColor,
                                width: 0.5,
                              ),
                              color: Colors.white),
                          itemHeight: 50,
                          itemPadding:
                          const EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 200,
                          dropdownWidth: 200,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 6,
                          scrollbarAlwaysShow: true,
                          offset: const Offset(20, -2),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 24.r, top: 24.r, left: 24.r),
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(text: 'العنوان', fontSize: 16.sp, fontWeight: FontWeight.w500),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: _controller.addressController,
                      keyboardType: TextInputType.streetAddress,
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
                          hintText: 'الرجاء إدخال العنزان هنا...',
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
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: AppColors.appMainColor, width: 1.w),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          constraints: const BoxConstraints(
                            maxHeight: 50,
                            minWidth: 48,
                          )),
                      validator: (name) => AppHelper.validateUserName(name: name!),
                    )

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
                    GetBuilder<RegisterController>(builder: (controller) => TextFormField(
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
                margin: EdgeInsets.only(right: 24.r, top: 24.r, left: 24.r),
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(text: 'تأكيد كلمة المرور', fontSize: 16.sp, fontWeight: FontWeight.w500),
                    SizedBox(height: 8.h),
                    GetBuilder<RegisterController>(builder: (controller) => TextFormField(
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
                      validator: (confirmPassword) => AppHelper.validateConfirmPassword(conformPassword: confirmPassword!, password: controller.passwordController.text),
                    ))
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 36.r),
                  child: AppWidgets.CustomButton(
                      text: 'إنشاء حساب',
                      background: AppColors.appMainColor,
                      borderColor: AppColors.appMainColor,
                      click: () => Get.offAndToNamed(Routes.home))),
              Container(
                margin: EdgeInsets.only(top: 16.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.medium(text: 'لدي حساب بالفعل '),
                    InkWell(
                      child: AppText.medium(text: ' تسجيل الدخول'),
                      onTap: () => Get.toNamed(Routes.login),),
                  ],
                ),
              ),
              Center(
                child: Obx(() => controller.isLoading.isFalse ? AppWidgets.CustomAnimationProgress() : Container()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
