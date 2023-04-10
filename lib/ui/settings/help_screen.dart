import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medical_services/controller/settings_controller.dart';
import 'package:medical_services/utils/app_color.dart';
import 'package:medical_services/utils/app_text.dart';
import 'package:medical_services/utils/constants.dart';

class HelpScreen extends StatelessWidget {

  final _controller = Get.put(SettingsController());

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
            text: 'مركز المساعدة',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsetsDirectional.only(
                    start: 20.r, end: 20.r, top: 30.r),
                child: AppText.medium(text: 'الأسئلة الشائعة', fontWeight: FontWeight.w400, fontSize: 18.sp, color: AppColors.appMainColor)),
            Container(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsetsDirectional.only(
                    start: 20.r, end: 20.r,  top: 20.r),
                padding: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
                decoration: BoxDecoration(
                  color: HexColor(AppColors.formSearchColor),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      enabled: true,
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
            ListView.builder(
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) => Align(
                  alignment: AlignmentDirectional.center,
                  child: Container(
                    margin: EdgeInsets.only(top: 20.r),
                    width: 350.w,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: HexColor(AppColors.formSearchColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(top: 11),
                      child: ExpandableTheme(
                          data: const ExpandableThemeData(useInkWell: true),
                          child: Container(child: buildExpandedHelp())),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget buildExpandedHelp() => ExpandableNotifier(
      child: Container(
        color: HexColor(AppColors.formSearchColor),
        width: double.infinity,
        child: ScrollOnExpand(
          scrollOnExpand: true,
          scrollOnCollapse: false,
          child: Container(
            width: 200,
            color: HexColor(AppColors.formSearchColor),
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                iconColor: AppColors.appMainColor,
                expandIcon: Icons.keyboard_arrow_up_rounded,
                collapseIcon: Icons.keyboard_arrow_down_rounded,
                iconSize: 30,
              ),
              header: Container(
                margin: EdgeInsetsDirectional.only(bottom: 10.r, start: 20.r),
                decoration: BoxDecoration(
                    color: HexColor(AppColors.formSearchColor),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Container(
                  child: AppText.medium(
                    text: 'كيفية استخدام تطبيق الخدمات الطبية؟',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              collapsed: Container(),
              expanded: Container(
                color: HexColor(AppColors.formSearchColor),
                width: double.infinity,
                margin: EdgeInsets.only(right: 16.r, left: 16.r, top: 8.r, bottom: 8.r),
                child: AppText.medium(text: '${_controller.text}',maxline: 10, fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.textSubColor2),
                
              ),
              builder: (_, collapsed, expanded) {
                return Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                  theme: const ExpandableThemeData(crossFadePoint: 0),
                );
              },
            ),
          ),
        ),
      ));
}
