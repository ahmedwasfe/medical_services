import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medical_services/controller/cart_controller.dart';
import 'package:medical_services/routes/routes.dart';
import 'package:medical_services/utils/app_color.dart';
import 'package:medical_services/utils/app_helper.dart';
import 'package:medical_services/utils/app_text.dart';
import 'package:medical_services/utils/components.dart';
import 'package:medical_services/utils/constants.dart';

class CartPage extends StatelessWidget {
  final _controller = Get.put(CartController());

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
            text: 'المشتربات',
            color: Colors.black),
        toolbarHeight: 60.h,
        centerTitle: true,
      ),
      body: FutureBuilder(
        builder: (context, snapshot) => GetBuilder<CartController>(
            builder: (controller) => Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ListView.builder(
                        itemCount: 18,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => buildCartItem()),
                    Container(
                      color: Colors.white,
                      height: 165.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              children: [
                                AppText.medium(text: 'الخصم:', color: AppColors.appMainColor),
                                Spacer(),
                                AppText.medium(text: '5%', fontSize: 14)
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              children: [
                                AppText.medium(text: 'التوصيل::', color: AppColors.appMainColor),
                                Spacer(),
                                AppText.medium(text: '10 شيكل', fontSize: 14)
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              children: [
                                AppText.medium(text: 'التكلفة الإجمالية:', color: AppColors.appMainColor),
                                Spacer(),
                                AppText.medium(text: '1100 شيكل', fontSize: 14)
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: AppWidgets.CustomButton(
                                text: 'تأكيد طلب الشراء',
                                background: AppColors.appMainColor,
                                borderColor: AppColors.appMainColor,
                                click: () => AppHelper.showDoneSaleDialog(context)),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
      ),
    );
  }

  Widget buildCartItem() => Card(
    margin: const EdgeInsets.only(right: 8, left: 8, top: 12, bottom: 12).r,
    elevation: 8.r,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 12, right: 10, bottom: 12, left: 8).r,
                height: 80.h,
                width: 80.w,
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
                child:
                    Image.network('${Const.defaultImage}', fit: BoxFit.cover)),
            Container(
              margin: const EdgeInsets.only(right: 10).r,
              child: Column(
                children: [
                  Container(
                    width: 260,
                    child: Row(
                      children: [
                        Expanded(
                            child: AppText.medium(
                                text: 'كفات طبية',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700)),
                        Container(
                            margin: EdgeInsets.only(left: 12.r),
                            child: InkWell(
                              child: SvgPicture.asset(
                                  '${Const.icons}icon_delete.svg'),
                              onTap: () {},
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: 260,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppText.medium(
                            text: 'اللون:',
                            color: AppColors.textSubColor2,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                        Container(
                          margin: const EdgeInsets.only(top: 6, right: 8).r,
                          child: const CircleAvatar(
                            radius: 4,
                            backgroundColor: AppColors.appMainColor,
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(right: 20).r,
                            child: AppText.medium(
                                text: 'المقاس:',
                                color: AppColors.textSubColor2,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400)),
                        Container(
                            margin: const EdgeInsets.only(right: 10, top: 6).r,
                            child: AppText.medium(
                                text: 'L',
                                color: AppColors.appMainColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  Container(
                    width: 260,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 1).r,
                                width: 20,
                                height: 20,
                                child: FloatingActionButton(
                                  onPressed: () => _controller.increment(),
                                  elevation: 8,
                                  backgroundColor: Colors.white,
                                  mini: true,
                                  child: const Icon(Icons.add,
                                      color: AppColors.appMainColor, size: 18),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 12).r,
                                child: Obx(() => AppText.medium(
                                    text: '${_controller.quantity.value}',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600)),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 12).r,
                                width: 20,
                                height: 20,
                                child: FloatingActionButton(
                                  onPressed: () => _controller.decrement(),
                                  elevation: 8,
                                  backgroundColor: Colors.white,
                                  child: const Icon(Icons.remove,
                                      color: AppColors.appMainColor, size: 18),
                                  mini: true,
                                ),
                              )
                            ],
                          ),
                        )),
                        Container(
                            margin: EdgeInsets.only(left: 12.r),
                            child: AppText.medium(
                                text: '25 شيكل',
                                color: AppColors.appMainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
