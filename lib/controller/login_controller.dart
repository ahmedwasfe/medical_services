import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_services/api/api_requests.dart';
import 'package:medical_services/utils/app_helper.dart';

class LoginController extends GetxController{

  RxBool isLoading = false.obs;
  bool isVisiblePass = true;
  IconData visiblePassIcon = Icons.visibility;

  late GlobalKey<FormState> formKey;
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
    // usernameController.text = 'ahmed@mail.com';
    // passwordController.text = '12345678';
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon = isVisiblePass ? Icons.visibility : Icons.visibility_off;
    update();
  }

  void login({required String phone, required String password}) {
    bool isValidate = formKey.currentState!.validate();
    if (isValidate) {
      isLoading(true);
      ApiRequests.login(phone: phone, password: password)
      .then((value) {
        if(value != null){
          isLoading(true);
          AppHelper.showToast(message: value.result!);
        }
      });
    } else {
      isLoading(false);
    }
  }

}