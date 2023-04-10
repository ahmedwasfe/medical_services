import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medical_services/controller/product_details_controller.dart';
import 'package:medical_services/model/product_color.dart';
import 'package:medical_services/model/product_size.dart';
import 'package:medical_services/routes/routes.dart';
import 'package:medical_services/utils/app_color.dart';
import 'package:medical_services/utils/app_helper.dart';
import 'package:medical_services/utils/app_text.dart';
import 'package:medical_services/utils/components.dart';
import 'package:medical_services/utils/constants.dart';

class ProductDetailsScreen extends StatelessWidget {

  final _controller = Get.put(ProductDetailsController());

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
            text: 'إسم المنتج',
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
      body: FutureBuilder(
        future: _controller.getProductDetails(),
        builder: (context, snapshot) => Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // TODO IMAGE
                  Container(
                    height: 220.h,
                    margin: const EdgeInsets.all(10),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r)
                    ),
                    child: Obx(() => Image.network(
                      _controller.mainImage.value,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )),
                  ),
                  // TODO IMAGES
                  Container(
                    margin: const EdgeInsetsDirectional.only(top: 10),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _controller.listImages
                            .map((image) => InkWell(
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            margin: const EdgeInsets.only(top: 4, right: 8).r,
                            width: 80.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            child: Image.network(image, fit: BoxFit.cover),
                          ),
                          onTap: () {
                            _controller.loadMainImage(image);
                          },
                        ))
                            .toList(),
                      ),
                    ),
                  ),
                  // TODO NAME ADN PRICE
                  Container(
                    margin: const EdgeInsets.only(top: 16, right: 8, left: 8).r,
                    child: Row(
                      children: [
                        AppText.medium(
                            text: 'كفات طبية',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600),
                        const Spacer(),
                        AppText.medium(
                            text: '25 شيكل',
                            color: AppColors.appMainColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)
                      ],
                    ),
                  ),
                  // TODO RATING
                  /*Container(
                    margin: const EdgeInsets.only(top: 16, right: 8, left: 8).r,
                    child: Row(
                      children: [
                        RatingBarIndicator(
                          rating: 3.5,
                          itemBuilder: (context, index) =>
                              SvgPicture.asset(
                                  '${Const.icons}star_fill_orange.svg'),
                          itemCount: 5,
                          itemSize: 22,
                          direction: Axis.horizontal,
                          unratedColor: HexColor('CFCFCF'),
                        ),
                        SizedBox(width: 8.w),
                        AppText.medium(text: '(3.5)', color: AppColors.textSubColor2)
                      ],
                    ),
                  ),*/
                  // TODO QUANTITY
                  Container(
                    margin: const EdgeInsets.only(top: 26, right: 8, left: 8).r,
                    child: Row(
                      children: [
                        Container(
                          width: 88.w,
                          height: 28.h,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(color: AppColors.appMainColor)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                  child: const Icon(Icons.add, color: Colors.black),
                              onTap: () => _controller.increment()),
                              Obx(() => AppText.medium(text: '${_controller.quantity.value}', color: AppColors.appMainColor, fontSize: 16.sp, fontWeight: FontWeight.w700)),
                              InkWell(
                                  child: const Icon(Icons.remove, color: Colors.black),
                              onTap: () => _controller.decrement()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // TODO ALL QUANTITY
                  /*Container(
                    margin: const EdgeInsets.only(top: 16, right: 8, left: 8).r,
                    child: Row(
                      children: [
                        AppText.medium(
                            text: 'الكمية المتوفرة',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600),
                        const Spacer(),
                        AppText.medium(
                            text: '14 قطعة',
                            color: AppColors.appMainColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)
                      ],
                    ),
                  ),*/
                  // TODO SIZE
                  Container(
                    margin: const EdgeInsets.only(top: 16, right: 8, left: 8).r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(
                            text: 'اختر المقاس المناسب لديك',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600),
                        SizedBox(height: 8.h),
                        SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: FutureBuilder(
                              future: _controller.getSizes(),
                              builder: (context, snapshot) => Row(
                                children: _controller.listSizes.map((size) => GetBuilder<ProductDetailsController>(builder: (controller) => Container(
                                  margin: const EdgeInsets.all(4).r,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r)
                                  ),
                                  child: InkWell(
                                    child: Container(
                                      height: 33.h,
                                      width: 50.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: size.isSelected ? AppColors.appMainColor : Colors.white,
                                          borderRadius: BorderRadius.circular(4.r),
                                          border: Border.all(color: AppColors.appMainColor)
                                      ),
                                      child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          size.isSelected ? Container(
                                              alignment: Alignment.topRight,
                                              child: const Icon(Icons.check, size: 16, color: Colors.white)) : Container(),
                                          Container(
                                              alignment: Alignment.centerLeft,
                                              margin: const EdgeInsets.only(left: 10),
                                              child: AppText.medium(text: '${size.name}', color: size.isSelected ? Colors.white : Colors.black)),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      for(SizeData size in controller.listSizes){
                                        size.isSelected = false;
                                      }

                                      size.isSelected = true;
                                      controller.update();
                                    },
                                  ),
                                ))).toList(),
                              ),
                            )),
                      ],
                    ),
                  ),
                  // TODO COLOR
                  Container(
                    margin: const EdgeInsets.only(top: 16, right: 8, left: 8).r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(
                            text: 'اختر اللون المفضل ',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600),
                        SizedBox(height: 8.h),
                        FutureBuilder(
                          future: _controller.getColors(),
                          builder: (context, snapshot) => GridView.builder(
                              shrinkWrap: true,
                              physics:
                              const NeverScrollableScrollPhysics(),
                              itemCount: _controller.listColors.length,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 4,
                                mainAxisSpacing: 2,
                                childAspectRatio: 80 / 80,
                                crossAxisCount: AppHelper.getColorItemSize(),
                              ),
                              itemBuilder: (context, index) => GetBuilder<ProductDetailsController>(builder: (controller) => InkWell(
                                child: Container(
                                  margin: const EdgeInsets.all(4).r,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      border: Border.all(color: HexColor(controller.listColors[index].isSelected ? controller.listColors[index].hexaCode! : 'FFFFFF'))
                                  ),
                                  child: Card(
                                    elevation: 6,
                                    color: Colors.transparent,
                                    child: CircleAvatar(
                                      backgroundColor: HexColor(controller.listColors[index].hexaCode!),
                                      radius: 12,
                                    ),
                                  ),
                                ),
                                onTap: (){
                                  for(ColorData color in controller.listColors){
                                    color.isSelected = false;
                                  }

                                  controller.listColors[index].isSelected = true;
                                  controller.update();
                                },
                              ))),
                        ),
                      ],
                    ),
                  ),
                  // TODO DESCRIPTION
                  Container(
                    margin: const EdgeInsets.only(top: 16, right: 8, left: 8).r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(
                            text: 'وصف المنتج ',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600),
                        SizedBox(height: 8.h),
                        AppText.medium(
                            maxline: 8,
                            color: AppColors.textSubColor2,
                            textAlign: TextAlign.right,
                            text: 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما المزيد...')
                      ],
                    ),
                  ),
                  // TODO RELATED PRODUCTS
                  Container(
                    margin: const EdgeInsets.only(top: 26, right: 16, left: 16).r,
                    child: Row(
                      children: [
                        AppText.medium(
                            text: 'منتجات مشابهة',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600),
                        const Spacer(),
                        InkWell(
                          child: AppText.medium(
                              text: 'عرض الكل',
                              color: AppColors.appMainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                          onTap: (){},
                        )
                      ],
                    ),
                  ),
                  // TODO RELATED PRODUCTS
                  FutureBuilder(
                    builder: (context, snapshot) => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 8,
                      itemBuilder: (context, index) => buildProductItem(),
                    ),
                  )
                ],
              ),
            ),
            // TODO BUTTON
            Container(
              margin: EdgeInsets.only(bottom: 22.r),
              alignment: Alignment.bottomCenter,
              child: AppWidgets.CustomButton(
                  text: 'أضف للمشتريات',
                  background: AppColors.appMainColor,
                  borderColor: AppColors.appMainColor,
                  click: () {}),
            )
          ],
        ),
      ),
    );
  }

  Widget buildProductItem() => InkWell(
    child: Container(
      width: double.infinity,
      height: 150.h,
      margin: const EdgeInsets.only(top: 8, bottom: 8, right: 12, left: 12).r,
      decoration: BoxDecoration(
          color: AppColors.lightGray3,
          borderRadius: BorderRadius.circular(8.r)
      ),
      child: Row(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 12, right: 10, bottom: 12, left: 8).r,
              height: 100.h,
              width: 80.w,
              clipBehavior: Clip.antiAlias,
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
              child:
              Image.network('${Const.defaultImage}', fit: BoxFit.cover)),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 12).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.medium(
                      text: 'كفات طبية',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                  AppText.medium(
                      text: 'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSubColor2,
                      maxline: 2),
                  AppText.medium(
                      text: '25 شيكل',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.appMainColor),
                  Row(
                    children: [
                      SvgPicture.asset('${Const.icons}star_fill_orange.svg', fit: BoxFit.scaleDown, width: 16.w, height: 16.h),
                      SizedBox(width: 8.w),
                      AppText.medium(text: '4.9', color: AppColors.textSubColor2, fontSize: 12.sp),
                      SizedBox(width: 8.w),
                      Container(color: AppColors.textSubColor2, height: 14.h, width: 2.w),
                      AppText.medium(text: '  5.3215 مراجعات', color: AppColors.textSubColor2, fontSize: 12.sp),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    onTap: () => Get.toNamed(Routes.productDetails),
  );
}