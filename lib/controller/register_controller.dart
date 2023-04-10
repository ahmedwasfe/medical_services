import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class RegisterController extends GetxController{

  RxBool isLoading = false.obs;
  bool isVisiblePass = true;
  bool isVisibleConfirmPass = true;
  IconData visiblePassIcon = Icons.visibility;
  IconData visibleConfirmPassIcon = Icons.visibility;

  XFile? userImage;
  RxString? citySelected = ''.obs;

  final List<String> listCities = [
    'رام الله',
    'القدس',
    'نابلس',
    'طولكرم',
    'الخليل',
    'غزة',
    'قلقيلية',
    'الناصرة',
    'صفد',
    'يافا',
    'حيفا'
  ];

  late GlobalKey<FormState> formKey;
  late TextEditingController nameController;
  late TextEditingController enterpriseController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    enterpriseController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
    // emailController.text = 'ahmed@mail.com';
    // usernameController.text = 'ahmed';
    // passwordController.text = '12345678';
    // confirmPasswordController.text = '12345678';
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    nameController.dispose();
    enterpriseController.dispose();
    phoneController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void requestStoragePermission() async {
    if (await Permission.storage.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
      print("storage permission: ${statuses[Permission.storage]}");
      pickImageGallary();
    }else
      pickImageGallary();
  }

  void pickImageGallary() async {
    final ImagePicker picker = ImagePicker();
    userImage = await picker.pickImage(source: ImageSource.gallery);
    update();
  }

  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon = isVisiblePass ? Icons.visibility : Icons.visibility_off;
    update();
  }

  void visibleConfirmPassword() {
    isVisibleConfirmPass = !isVisibleConfirmPass;
    visibleConfirmPassIcon = isVisibleConfirmPass ? Icons.visibility : Icons.visibility_off;
    update();
  }

}