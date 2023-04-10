import 'dart:convert';

import 'package:get/get.dart';
import 'package:medical_services/api/api_requests.dart';
import 'package:medical_services/model/sections/main_sections.dart';
import 'package:medical_services/utils/constants.dart';

class HomePageController extends GetxController{

  List<MainSectionData> listMainSections = [];


  List<String> listSliders = [
    Const.defaultImage,
    Const.sliderImage2,
  ];

  Future<void> getMainSections() async {
    await ApiRequests.getMainSections()
        .then((value) {
          if(value != null){
            listMainSections.clear();
            listMainSections.addAll(value.data!);
            // print('SIZE: ${jsonEncode(listMainSections)}');
          }
    });
  }

}