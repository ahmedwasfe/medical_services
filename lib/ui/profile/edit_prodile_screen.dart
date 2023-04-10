import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medical_services/controller/profile_controller.dart';
import 'package:medical_services/controller/register_controller.dart';
import 'package:medical_services/utils/app_color.dart';
import 'package:medical_services/utils/app_helper.dart';
import 'package:medical_services/utils/app_text.dart';
import 'package:medical_services/utils/components.dart';
import 'package:medical_services/utils/constants.dart';

class EditProfileScreen extends StatelessWidget {

  final _controller = Get.put(ProfileController());
  final _registerController = Get.put(RegisterController());

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
            text: 'تعديل الملف الشخصي',
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
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.center,
                child: GetBuilder<ProfileController>(builder: (controller) => Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    controller.userImage == null
                        ? CircleAvatar(
                      radius: 55.r,
                      backgroundImage: const NetworkImage(Const.defaultUserImage),
                    )
                        : CircleAvatar(
                      radius: 55.r,
                      backgroundImage: FileImage(File(controller.userImage!.path)),
                    ),
                    InkWell(
                        child: SvgPicture.asset('${Const.icons}icon_edit.svg'),
                        onTap: () => controller.requestStoragePermission())
                  ],
                )),
              ),
              Container(
                margin: EdgeInsets.only(top: 39.r, left: 22.r, right: 22.r),
                child: TextFormField(
                  controller: _controller.nameController,
                  textInputAction: TextInputAction.go,
                  keyboardType: TextInputType.text,
                  cursorColor: AppColors.appMainColor,
                  cursorWidth: 1.3.w,
                  cursorRadius: Radius.circular(10).r,
                  enabled: true,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: Colors.black),
                  decoration: InputDecoration(
                      hintText: '',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.h,
                          fontWeight: FontWeight.w400
                      ),
                      fillColor: Color(0xffFAFAFA),
                      filled: true,
                      helperMaxLines: 2,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 1.w),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: AppColors.appMainColor, width: 1.w),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      constraints: BoxConstraints(
                        maxHeight: 343.h,
                        minWidth: 48.w,
                      )),
                  validator: (username) => AppHelper.validateUserName(name: username!),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 39.r, left: 22.r, right: 22.r),
                child: TextFormField(
                  controller: _controller.emailController,
                  textInputAction: TextInputAction.go,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: AppColors.appMainColor,
                  cursorWidth: 1.3.w,
                  cursorRadius: Radius.circular(10).r,
                  enabled: true,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: Colors.black),
                  decoration: InputDecoration(
                      hintText: '',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.h,
                          fontWeight: FontWeight.w400
                      ),
                      fillColor: Color(0xffFAFAFA),
                      filled: true,
                      helperMaxLines: 2,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 1.w),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: AppColors.appMainColor, width: 1.w),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      constraints: BoxConstraints(
                        maxHeight: 343.h,
                        minWidth: 48.w,
                      )),
                  validator: (username) => AppHelper.validateUserName(name: username!),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.r, left: 22.r, right: 22.r),
                child: TextFormField(
                  controller: _controller.phoneController,
                  textInputAction: TextInputAction.go,
                  keyboardType: TextInputType.phone,
                  cursorColor: AppColors.appMainColor,
                  cursorWidth: 1.3.w,
                  cursorRadius: Radius.circular(10).r,
                  enabled: true,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: Colors.black),
                  decoration: InputDecoration(
                      hintText: '',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.h,
                          fontWeight: FontWeight.w400
                      ),
                      fillColor: Color(0xffFAFAFA),
                      filled: true,
                      helperMaxLines: 2,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 1.w),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: AppColors.appMainColor, width: 1.w),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      constraints: BoxConstraints(
                        maxHeight: 343.h,
                        minWidth: 48.w,
                      )),
                  validator: (username) => AppHelper.validateUserName(name: username!),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.r, left: 22.r, right: 22.r),
                child: TextFormField(
                  controller: _controller.enterpriseController,
                  textInputAction: TextInputAction.go,
                  keyboardType: TextInputType.text,
                  cursorColor: AppColors.appMainColor,
                  cursorWidth: 1.3.w,
                  cursorRadius: Radius.circular(10).r,
                  enabled: true,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: Colors.black),
                  decoration: InputDecoration(
                      hintText: '',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.h,
                          fontWeight: FontWeight.w400
                      ),
                      fillColor: const Color(0xffFAFAFA),
                      filled: true,
                      helperMaxLines: 2,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 1.w),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: AppColors.appMainColor, width: 1.w),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      constraints: BoxConstraints(
                        maxHeight: 343.h,
                        minWidth: 48.w,
                      )),
                  validator: (username) => AppHelper.validateUserName(name: username!),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 24.r, top: 24.r, left: 24.r),
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetBuilder<RegisterController>(builder: (controller) => Container(
                      color: const Color(0xffFAFAFA),
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
                              color: const Color(0xffFAFAFA)),
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
                margin: EdgeInsets.only(top: 20.r, left: 22.r, right: 22.r),
                child: TextFormField(
                  controller: _controller.addressController,
                  textInputAction: TextInputAction.go,
                  keyboardType: TextInputType.streetAddress,
                  cursorColor: AppColors.appMainColor,
                  cursorWidth: 1.3.w,
                  cursorRadius: Radius.circular(10).r,
                  enabled: true,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: Colors.black),
                  decoration: InputDecoration(
                      hintText: '',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.h,
                          fontWeight: FontWeight.w400
                      ),
                      fillColor: Color(0xffFAFAFA),
                      filled: true,
                      helperMaxLines: 2,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 1.w),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: AppColors.appMainColor, width: 1.w),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      constraints: BoxConstraints(
                        maxHeight: 343.h,
                        minWidth: 48.w,
                      )),
                  validator: (username) => AppHelper.validateUserName(name: username!),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.r, bottom: 20.r),
                child: AppWidgets.CustomButton(
                    text: 'تعديل',
                    background: AppColors.appMainColor,
                    borderColor: AppColors.appMainColor,
                    click: () => AppHelper.showDoneSaleDialog(context)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
