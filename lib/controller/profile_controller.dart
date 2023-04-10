import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_services/utils/app_color.dart';
import 'package:medical_services/utils/app_helper.dart';
import 'package:medical_services/utils/app_text.dart';
import 'package:medical_services/utils/components.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileController extends GetxController{

  RxBool isLoading = false.obs;
  XFile? userImage;

  late GlobalKey<FormState> formKey;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController enterpriseController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    emailController = TextEditingController();
    enterpriseController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    super.onInit();

    nameController.text = 'أحمد أبو منديل';
    emailController.text = 'ahmed@mail.com';
    enterpriseController.text = 'Enterprise';
    phoneController.text = '0594781288';
    addressController.text = 'Palstine|Gaza|Al-Nasaer Street';

  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    nameController.dispose();
    emailController.dispose();
    enterpriseController.dispose();
    phoneController.dispose();
    addressController.dispose();
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

  void showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: AppHelper.getBottomSheetSize(),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 4,
                  width: 50,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(height: 20),
                AppText.larg(
                    text: AppHelper.getCurrentUserToken() != null ? 'تسجيل خروج' : 'تسجيل دخول', fontSize: 20.sp, fontWeight: FontWeight.w700),
                SizedBox(height: 14),
                AppText.larg(
                    text: AppHelper.getCurrentUserToken() != null ? 'هل أنت متأكد من عملية \nالخروج من التطبيق' : 'الرجاء تسجيل الدخول أولاً للمتابعة \n لأنك الآن في وضع الضيف',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin: EdgeInsetsDirectional.only(top: 30, end: 10),
                          width: double.infinity,
                          child: AppWidgets.CustomButton(
                              radius: 8,
                              background: AppColors.appMainColor,
                              borderColor: AppColors.appMainColor,
                              text: AppHelper.getCurrentUserToken() != null ? 'تسجيل خروج'.tr : 'تسجيل دخول'.tr,
                              isUpperCase: false,
                              click: () {
                                if(AppHelper.getCurrentUserToken() != null) {
                                  AppHelper.goToLogin();
                                } else {
                                  AppHelper.goToLogin();
                                }
                              })),
                    ),
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          margin:
                          EdgeInsetsDirectional.only(top: 30, start: 10),
                          child: AppWidgets.CustomButton(
                              radius: 8,
                              background: AppColors.lightWhite,
                              borderColor: AppColors.appMainColor,
                              text: 'إلغاء',
                              textColor: AppColors.appMainColor,
                              isUpperCase: false,
                              click: () => Navigator.pop(context))),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          );
        });
  }

}