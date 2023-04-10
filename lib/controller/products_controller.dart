import 'package:get/get.dart';
import 'package:medical_services/api/api_requests.dart';
import 'package:medical_services/model/products/products.dart';

class ProductsController extends GetxController{

  List<ProductData> listProducts = [];



  Future<void> getProducts({required int sectionId}) async {
    await ApiRequests.getProductsBySection(sectionId: sectionId)
        .then((value) {
          if(value != null){
            listProducts.clear();
            listProducts.addAll(value.data!);
          }
    });
  }

}