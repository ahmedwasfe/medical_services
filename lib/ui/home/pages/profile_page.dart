import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medical_services/controller/home_controller.dart';
import 'package:medical_services/controller/profile_controller.dart';
import 'package:medical_services/routes/routes.dart';
import 'package:medical_services/utils/app_helper.dart';
import 'package:medical_services/utils/app_text.dart';
import 'package:medical_services/utils/constants.dart';

class ProfilePage extends StatelessWidget {

  final _controller = Get.put(ProfileController());

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
            text: 'الملف الشخصي',
            color: Colors.black),
        toolbarHeight: 60.h,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 55.r,
                    backgroundImage: NetworkImage(Const.defaultUserImage),
                  ),
                  SizedBox(height: 10.h),
                  AppText.medium(text: 'أحمد أبو منديل', fontSize: 20.sp, fontWeight: FontWeight.w600),
                  AppText.medium(text: 'ahmed@mail.com', fontSize: 16.sp, fontWeight: FontWeight.w400)
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 22, right: 22, top: 45).r,
              child: InkWell(
                child: Row(
                  children: [
                    SvgPicture.asset('${Const.icons}icon_user.svg'),
                    SizedBox(width: 20.w),
                    AppText.medium(text: 'تعديل الملف الشخصي', fontSize: 16.sp, fontWeight: FontWeight.w500),
                    Spacer(),
                    SvgPicture.asset('${Const.icons}icon_arrow.svg', height: 16.h, width: 16.w)
                  ],
                ),
                onTap: () => Get.toNamed(Routes.editProfile),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 22, right: 22, top: 39).r,
              child: InkWell(
                child: Row(
                  children: [
                    SvgPicture.asset('${Const.icons}icon_change_password.svg'),
                    SizedBox(width: 20.w),
                    AppText.medium(text: 'تغيير كلمة المرور', fontSize: 16.sp, fontWeight: FontWeight.w500),
                    Spacer(),
                    SvgPicture.asset('${Const.icons}icon_arrow.svg', height: 16.h, width: 16.w)
                  ],
                ),
                onTap: () => Get.toNamed(Routes.changePassword),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 22, right: 16, top: 39).r,
              child: InkWell(
                child: Row(
                  children: [
                    SvgPicture.asset('${Const.icons}icon_purchases.svg'),
                    SizedBox(width: 20.w),
                    AppText.medium(text: 'المشتريات', fontSize: 16.sp, fontWeight: FontWeight.w500),
                    Spacer(),
                    SvgPicture.asset('${Const.icons}icon_arrow.svg', height: 16.h, width: 16.w)
                  ],
                ),
                onTap: () {
                  HomeController home = Get.find();
                  home.getCurrenNavIndex(navIndex: 1);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 22, right: 16, top: 39).r,
              child: InkWell(
                child: Row(
                  children: [
                    SvgPicture.asset('${Const.icons}icon_privacy.svg'),
                    SizedBox(width: 20.w),
                    AppText.medium(text: 'سياسة الخصوصية', fontSize: 16.sp, fontWeight: FontWeight.w500),
                    Spacer(),
                    SvgPicture.asset('${Const.icons}icon_arrow.svg', height: 16.h, width: 16.w)
                  ],
                ),
                onTap: () => Get.toNamed(Routes.privacyPolicy),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 22, right: 16, top: 39).r,
              child: InkWell(
                child: Row(
                  children: [
                    SvgPicture.asset('${Const.icons}icon_help.svg'),
                    SizedBox(width: 20.w),
                    AppText.medium(text: 'مركز المساعدة', fontSize: 16.sp, fontWeight: FontWeight.w500),
                    Spacer(),
                    SvgPicture.asset('${Const.icons}icon_arrow.svg', height: 16.h, width: 16.w)
                  ],
                ),
                onTap: () => Get.toNamed(Routes.help),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 22, right: 18, top: 39).r,
              child: InkWell(
                child: Row(
                  children: [
                    SvgPicture.asset('${Const.icons}icon_contact.svg'),
                    SizedBox(width: 20.w),
                    AppText.medium(text: 'تواصل معنا', fontSize: 16.sp, fontWeight: FontWeight.w500),
                    Spacer(),
                    SvgPicture.asset('${Const.icons}icon_arrow.svg', height: 16.h, width: 16.w)
                  ],
                ),
                onTap: () => Get.toNamed(Routes.contactUs),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 22, right: 16, top: 39).r,
              child: InkWell(
                child: Row(
                  children: [
                    SvgPicture.asset('${Const.icons}icon_about.svg'),
                    SizedBox(width: 20.w),
                    AppText.medium(text: 'معلومات عنا', fontSize: 16.sp, fontWeight: FontWeight.w500),
                    Spacer(),
                    SvgPicture.asset('${Const.icons}icon_arrow.svg', height: 16.h, width: 16.w)
                  ],
                ),
                onTap: () => Get.toNamed(Routes.aboutUs),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 22, right: 16, top: 39).r,
              child: InkWell(
                child: Row(
                  children: [
                    SvgPicture.asset('${Const.icons}icon_logout.svg'),
                    SizedBox(width: 20.w),
                    AppText.medium(text: AppHelper.getCurrentUserToken() != null ? 'تسجيل خروج' : 'تسجيل دخول', color: Colors.red, fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ],
                ),
                onTap: () => _controller.showLogoutBottomSheet(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
