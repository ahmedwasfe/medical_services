import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medical_services/controller/boarding_controller.dart';
import 'package:medical_services/model/boarding.dart';
import 'package:medical_services/utils/app_color.dart';
import 'package:medical_services/utils/app_helper.dart';
import 'package:medical_services/utils/app_text.dart';
import 'package:medical_services/utils/components.dart';
import 'package:medical_services/utils/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingScreen extends GetView<BoardingController> {

  final _controller = Get.put(BoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        PageView.builder(
      controller: _controller.pageController,
          physics: const BouncingScrollPhysics(),
          itemCount: _controller.listBoarding.length,
          itemBuilder: (context, index) => pageViewScreens(_controller.listBoarding[index]),
          onPageChanged: (index) {
            if (index == _controller.listBoarding.length - 1) {
              _controller.isLast.value = true;
            } else {
              _controller.isLast.value = false;
            }
          }),
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          height: 150.h,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SmoothPageIndicator(
                controller: _controller.pageController,
                count: _controller.listBoarding.length,
                effect: CustomizableEffect(
                  dotDecoration: DotDecoration(
                    height: 10.h,
                    width: 10.w,
                    color: AppColors.appSubColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  activeDotDecoration: DotDecoration(
                    height: 10.h,
                    width: 10.w,
                    color: AppColors.appMainColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onDotClicked: (index) {
                  if (_controller.isLast.value) {
                    _controller.pageController.previousPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.easeInToLinear);
                  } else {
                    _controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.easeInToLinear);
                  }
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: AppWidgets.CustomButton(
                    width: 280.w,
                    height: 48.h,
                    background: AppColors.appMainColor,
                    borderColor: AppColors.appMainColor,
                    fontWeight: FontWeight.w700,
                    isUpperCase: false,
                    text: 'التالي', click: (){
                  if (_controller.isLast.value) {
                    print('LAST');
                    _controller.goToHome();
                  } else {
                    print('NEXT');
                    _controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInToLinear);
                  }
                }),
              ),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 50.r, right: 40.r),
            alignment: Alignment.topRight,
            child: InkWell(child: AppText.medium(text: 'تخطي', fontWeight: FontWeight.w600, fontSize: 20.sp),
                onTap: () => _controller.goToHome())),
        Container(
            alignment: Alignment.topLeft,
            child: Image.asset('${Const.images}ellipse.png')),
      ],
    ),
    );
  }

  Widget pageViewScreens(Boarding boarding) => Container(
    margin: EdgeInsets.only(top: 20.r),
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: 400,
          width: double.infinity,
          child: Image.asset('${Const.images}${boarding.image}',
              fit: BoxFit.contain),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 180.0).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r),
                child: AppText.medium(
                    fontWeight: FontWeight.w700,
                    text: boarding.title,
                    textAlign: TextAlign.start,
                    maxline: 3),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 20.r),
                child: AppText.medium(
                    fontWeight: FontWeight.w400,
                    text: boarding.subTitle,
                    textAlign: TextAlign.center,
                    maxline: 4),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
