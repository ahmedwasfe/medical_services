import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medical_services/controller/home_controller.dart';
import 'package:medical_services/utils/app_color.dart';
import 'package:medical_services/utils/app_helper.dart';
import 'package:medical_services/utils/app_text.dart';
import 'package:medical_services/utils/constants.dart';

class HomeScreen extends StatelessWidget {

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) => Scaffold(
      backgroundColor: Colors.white,
      body: controller.listScreens[controller.navIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsetsDirectional.only(top: 10.r, bottom: 10.r),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: AppColors.appMainColor,
            borderRadius: BorderRadius.circular(14.r)),
        child: BottomNavigationBar(
          elevation: 20,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.appMainColor,
          currentIndex: controller.navIndex,
          items: _bottomNavigationBarItems(),
          onTap: (navIndex) => controller.getCurrenNavIndex(navIndex: navIndex),
        ),
      ),
    ));
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItems() => [
    BottomNavigationBarItem(
        activeIcon: SvgPicture.asset('${Const.icons}icon_home.svg', color: AppColors.appMainColor),
        icon: SvgPicture.asset('${Const.icons}icon_home.svg'), label: 'الرئيسية'),
    BottomNavigationBarItem(
        activeIcon: SvgPicture.asset('${Const.icons}icon_cart.svg', color: AppColors.appMainColor),
        icon: SvgPicture.asset('${Const.icons}icon_cart.svg'), label: 'المشتريات'.tr),
    BottomNavigationBarItem(
        activeIcon: SvgPicture.asset('${Const.icons}icon_profile.svg', color: AppColors.appMainColor),
        icon: SvgPicture.asset('${Const.icons}icon_profile.svg'), label: 'الملف الشخصي'.tr),
  ];
}
