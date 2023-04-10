import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{

  RxBool isLoading = false.obs;

  bool isVisibleOldPass = true;
  bool isVisibleNewPass = true;
  bool isVisibleConfirmPass = true;

  IconData visibleOldPassIcon = Icons.visibility;
  IconData visibleNewPassIcon = Icons.visibility;
  IconData visibleConfirmPassIcon = Icons.visibility;

  late GlobalKey<FormState> formKey;
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;


  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void visibleOldPassword() {
    isVisibleOldPass = !isVisibleOldPass;
    visibleOldPassIcon = isVisibleOldPass ? Icons.visibility : Icons.visibility_off;
    update();
  }

  void visibleNewPassword() {
    isVisibleNewPass = !isVisibleNewPass;
    visibleNewPassIcon = isVisibleNewPass ? Icons.visibility : Icons.visibility_off;
    update();
  }

  void visibleConfirmPassword() {
    isVisibleConfirmPass = !isVisibleConfirmPass;
    visibleConfirmPassIcon = isVisibleConfirmPass ? Icons.visibility : Icons.visibility_off;
    update();
  }

}