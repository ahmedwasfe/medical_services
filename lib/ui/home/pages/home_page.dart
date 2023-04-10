import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medical_services/controller/home_controller.dart';
import 'package:medical_services/controller/home_page_controller.dart';
import 'package:medical_services/model/sections/main_sections.dart';
import 'package:medical_services/routes/routes.dart';
import 'package:medical_services/ui/section/sub_sections_screen.dart';
import 'package:medical_services/utils/app_color.dart';
import 'package:medical_services/utils/app_helper.dart';
import 'package:medical_services/utils/app_text.dart';
import 'package:medical_services/utils/constants.dart';

class HomePage extends StatelessWidget {

  final _controller = Get.put(HomePageController());

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
            text: 'الرئيسية', color: Colors.black),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: InkWell(
          child: Container(
              margin: const EdgeInsets.only(right: 16, top: 8).r,
              child: const CircleAvatar(
                backgroundImage: NetworkImage('${Const.defaultUserImage}'),
              )),
          onTap: () {
            final HomeController homeController = Get.find();
            homeController.getCurrenNavIndex(navIndex: 2);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            InkWell(
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsetsDirectional.only(
                      start: 20.r, end: 20.r),
                  padding: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
                  decoration: BoxDecoration(
                    color: HexColor(AppColors.formSearchColor),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        enabled: false,
                        hintText: 'ابحث هنا......',
                        filled: true,
                        fillColor: HexColor(AppColors.formSearchColor),
                        hintStyle: const TextStyle(
                          color: Color(0xff9B9B9B),
                          fontSize: 14,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: HexColor(AppColors.formSearchColor),
                              width: 0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        constraints: BoxConstraints(
                          maxWidth: 343.w,
                          maxHeight: 50.h,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: HexColor(AppColors.formSearchColor),
                            width: 1.w,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        prefixIcon: Container(
                            height: 8,
                            width: 8,
                            child: Image.asset(
                              '${Const.icons}icon_search_fill.png',
                              height: 8,
                              width: 8,
                            )),
                    suffixIcon: SvgPicture.asset('${Const.icons}filter.svg',fit: BoxFit.scaleDown,)),
                  )),
              onTap: () {
              },
            ),
            FutureBuilder(
                future: _controller.getMainSections(),
                builder: (context, snapshot) => GetBuilder<HomePageController>(builder: (controller) =>
                Column(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: ImageSlideshow(
                          width: 370,
                          height: 170,
                          initialPage: 0,
                          indicatorColor: Colors.transparent,
                          indicatorBackgroundColor: Colors.transparent,
                          autoPlayInterval: 5000,
                          isLoop: true,
                          children: controller.listSliders
                              .map((image) => InkWell(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: Image.network(
                                image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            onTap: () {},
                          ))
                              .toList(),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10, top: 20).r,
                      child: Row(
                        children: [
                          AppText.medium(text: 'جميع الأقسام', fontSize: 18.sp, fontWeight: FontWeight.w600),
                          Spacer(),
                          InkWell(
                              child: AppText.medium(text: 'عرض الكل', color: AppColors.appMainColor, fontSize: 12.sp, fontWeight: FontWeight.w600),
                          onTap: (){}),
                        ],
                      ),
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        physics:
                        const NeverScrollableScrollPhysics(),
                        itemCount: _controller.listMainSections.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 15,
                          childAspectRatio: 88 / 110,
                          crossAxisCount: AppHelper.getGridItemSize(),
                        ),
                        itemBuilder: (context, index) => buildMainSectionsItem(_controller.listMainSections[index]))
                  ],
                )))
          ],
        ),
      ),
    );
  }

  buildMainSectionsItem(MainSectionData section) => InkWell(
      child: Container(
        margin: const EdgeInsets.only(right: 8, left: 8, top: 20).r,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.lightGray2,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Image.memory(AppHelper.getBinaryImage(image: section.groupImage!),
              height: 180.h,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            SizedBox(
              height: 16,
            ),
            AppText.medium(
              text: section.groupName!,
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
      onTap: () => Get.to(() => SubSectionsScreen(mainSection: section)));
}
