import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medical_services/controller/sub_section_controller.dart';
import 'package:medical_services/model/sections/main_sections.dart';
import 'package:medical_services/model/sections/sub_sections.dart';
import 'package:medical_services/routes/routes.dart';
import 'package:medical_services/ui/section/products_screen.dart';
import 'package:medical_services/utils/app_color.dart';
import 'package:medical_services/utils/app_helper.dart';
import 'package:medical_services/utils/app_text.dart';
import 'package:medical_services/utils/components.dart';
import 'package:medical_services/utils/constants.dart';

class SubSectionsScreen extends StatelessWidget {

  final _controller = Get.put(SubSectionController());
  final MainSectionData? mainSection;
  SubSectionsScreen({this.mainSection});

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
            text: mainSection!.groupName!,
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
        future: _controller.getSubSections(sectionId: mainSection!.groupID!),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(_controller.listSubSections.isNotEmpty){
              return GridView.builder(
                  shrinkWrap: true,
                  physics:
                  const BouncingScrollPhysics(),
                  itemCount: _controller.listSubSections.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 15,
                    childAspectRatio: 88 / 100,
                    crossAxisCount: AppHelper.getGridItemSize(),
                  ),
                  itemBuilder: (context, index) => buildSubSectionsItem(_controller.listSubSections[index]));
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

  buildSubSectionsItem(SubSectionData section) => InkWell(
      child: Container(
        margin: const EdgeInsets.only(right: 8, left: 8, top: 20).r,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.lightWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.lightGray6)
        ),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r)
              ),
              margin: const EdgeInsets.only(right: 10, left: 10, top: 12),
              child: Image.memory(AppHelper.getBinaryImage(image: section.subGroupImage!),
                height: 120.h,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            AppText.medium(
              text: section.subGroupName!,
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
      onTap: () => Get.to(ProductsScreen(subSectionData: section)));
}
