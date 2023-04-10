import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_services/ui/home/pages/cart_page.dart';
import 'package:medical_services/ui/home/pages/home_page.dart';
import 'package:medical_services/ui/home/pages/profile_page.dart';

class HomeController extends GetxController{


  List<Widget> listScreens = [
    HomePage(),
    CartPage(),
    ProfilePage()
  ];

  var navIndex = 0;

  void getCurrenNavIndex({required int navIndex}) async {
    this.navIndex = navIndex;
    update();
  }

}