import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medical_services/controller/products_controller.dart';
import 'package:medical_services/model/sections/sub_sections.dart';
import 'package:medical_services/routes/routes.dart';
import 'package:medical_services/utils/app_color.dart';
import 'package:medical_services/utils/app_text.dart';
import 'package:medical_services/utils/components.dart';
import 'package:medical_services/utils/constants.dart';

class ProductsScreen extends StatelessWidget {

  final _controller = Get.put(ProductsController());
  SubSectionData? subSectionData;
  ProductsScreen({this.subSectionData});

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
            text: subSectionData!.subGroupName!,
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
        future: _controller.getProducts(sectionId: subSectionData!.id!),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(_controller.listProducts.isNotEmpty){
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _controller.listProducts.length,
                itemBuilder: (context, index) => buildProductItem(),
              );
            }else{
              return Center(
                child: Container(
                  width: 280,
                  height: 350,
                  child: Column(
                    children: [
                      Image.asset('${Const.images}no_data.jpg'),
                      AppText.medium(text: 'لا يوجد بيانات حالياً', fontSize: 18, fontWeight: FontWeight.w600)
                    ],
                  ),
                ),
              );
            }
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return AppWidgets.CustomAnimationProgress();
          }else {
            return Container();
          }
        },
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
