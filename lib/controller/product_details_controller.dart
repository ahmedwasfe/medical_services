import 'dart:convert';

import 'package:get/get.dart';
import 'package:medical_services/api/api_requests.dart';
import 'package:medical_services/model/product_color.dart';
import 'package:medical_services/model/product_size.dart';
import 'package:medical_services/utils/constants.dart';

class ProductDetailsController extends GetxController{

  RxString mainImage = ''.obs;
  RxInt quantity = 1.obs;
  String sizeSelected = '';

  List<String> listImages = [
    Const.defaultImage,
    Const.sliderImage,
    Const.defaultUserImage,
    Const.defaultImage,
    Const.sliderImage,
    Const.defaultUserImage
  ];

  List<ColorData> listColors = [];
  List<SizeData> listSizes = [];

  void loadMainImage(String image) {
    mainImage.value = image;
  }

  Future<void> getProductDetails() async {
    mainImage.value = Const.defaultImage;
  }

  void increment() {
    quantity.value++;
  }

  void decrement() {
    if (quantity.value == 1)
      return;
    else
      quantity--;
  }

  Future<void> getColors() async {
    await ApiRequests.getColors()
        .then((value) {
          if(value != null){
            listColors.clear();
            listColors.addAll(value.result!.colors!);
          }
    });
  }

  Future<void> getSizes() async {
    await ApiRequests.getSizes()
        .then((value) {
      if(value != null){
        listSizes.clear();
        listSizes.addAll(value.result!.sizes!);
      }
    });
  }

}