import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:medical_services/api/api_helper.dart';
import 'package:medical_services/model/auth/login.dart';
import 'package:medical_services/model/products/products.dart';
import 'package:medical_services/model/sections/main_sections.dart';
import 'package:medical_services/model/product_color.dart';
import 'package:medical_services/model/product_size.dart';
import 'package:medical_services/model/sections/sub_sections.dart';


class ApiRequests {
  
  static final _client = http.Client();
  
  static Future<ProductColor?> getColors() async {
    http.Response response = await _client.get(Uri.parse('http://darlana.tawaq3.com/api/color'));
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      ProductColor color = ProductColor.fromJson(body);
      return color;
    }
  }

  static Future<ProductSize?> getSizes() async {
    http.Response response = await _client.get(Uri.parse('http://darlana.tawaq3.com/api/size'));
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      ProductSize size = ProductSize.fromJson(body);
      return size;
    }
  }

  static Future<Login?> login({required String phone, required String password}) async {
    http.Response response = await _client.get(Uri.parse('${ApiHelper.LOGIN}?mobile=$phone&password=$password'));
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      Login login = Login.fromJson(body);
      print('SUCCESS: ${jsonEncode(login)}');
      return login;
    }else{
      print('ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<MainSections?> getMainSections() async {
    http.Response response = await _client.get(Uri.parse('${ApiHelper.MAIN_SECTIONS}'));

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      MainSections sections = MainSections.fromJson(body);
      // print('SUCCESS: ${(jsonEncode(sections.data))}');
      return sections;
    }else {
      print('ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<SubSections?> getSubSections({required int sectionId}) async {
    http.Response response = await _client.get(Uri.parse('${ApiHelper.SUB_SECTIONS}=$sectionId'));

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      SubSections sections = SubSections.fromJson(body);
      // print('SUCCESS: ${(jsonEncode(sections.data))}');
      return sections;
    }else {
      print('ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Products?> getProductsBySection({required int sectionId}) async {
    http.Response response = await _client.get(Uri.parse('${ApiHelper.PRODUCTS}=2'));

    if(response.statusCode == 200) {
      var body = jsonDecode(response.body);
      print('SUCCESS: ${(jsonEncode(body))}');
      Products products = Products.fromJson(body);
      print('SUCCESS: ${(jsonEncode(products.data))}');
      return products;
    }else {
      print('ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

}
