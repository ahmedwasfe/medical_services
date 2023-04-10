import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_services/model/boarding.dart';
import 'package:medical_services/routes/routes.dart';
import 'package:medical_services/utils/constants.dart';
import 'package:medical_services/utils/preferences_manager.dart';

class BoardingController extends GetxController{

  final PageController pageController = PageController();
  RxBool isLast = false.obs;
  List<Boarding> listBoarding = [
    Boarding(image: 'boarding1.png', title: 'أفضل نتيجة ورضاك على رأس أولوياتنا', subTitle: 'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم'),
    Boarding(image: 'boarding2.png', title: 'نحن نقدم خدمة احترافية بجودة عالية', subTitle: 'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم'),
  ];

  void goToHome() {
    PreferencesManager.saveAppData(key: Const.KEY_BOARDING, value: true)
        .then((value) => {if (value) Get.offAndToNamed(Routes.home)});
  }

}