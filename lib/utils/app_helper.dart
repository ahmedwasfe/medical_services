import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medical_services/routes/routes.dart';
import 'package:medical_services/utils/app_color.dart';
import 'package:medical_services/utils/app_text.dart';
import 'package:medical_services/utils/components.dart';
import 'package:medical_services/utils/constants.dart';
import 'preferences_manager.dart';


class AppHelper {

  static Future initServices() async {
    await Get.putAsync(() => PreferencesManager().initial());
  }

  static String? getCurrentUserToken() {
    if (PreferencesManager.getUserToken(key: Const.KEY_USER_TOKEN) != null) {
      return 'Bearer ${PreferencesManager.getUserToken(key: Const.KEY_USER_TOKEN)}';
    } else {
      return null;
    }
  }

  /*static User? getCurrentUser() {
    if (PreferencesManager.getUserData(key: Const.KEY_USER_DATA) != null) {
      return PreferencesManager.getUserData(key: Const.KEY_USER_DATA);
    } else {
      return null;
    }
  }
*/

  /*static String getAppLanguage() {
    if (PreferencesManager.getAppData(key: Const.KEY_LANGUAGE) != null &&
        PreferencesManager.getAppData(key: Const.KEY_LANGUAGE) != "") {
      String language = PreferencesManager.getAppData(key: Const.KEY_LANGUAGE);
      if (language == Const.KEY_LANGUAGE_AR)
        return Const.KEY_LANGUAGE_AR;
      else if (language == Const.KEY_LANGUAGE_EN) return Const.KEY_LANGUAGE_EN;
    }
    return Const.KEY_LANGUAGE_AR;
  }
*/

  static void showToast({required String message, Color color = Colors.black, ToastGravity gravity = ToastGravity.BOTTOM}){
    Fluttertoast.showToast(
        msg: message.tr,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static RegExp emailValidate() {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  }

  static bool validate({required String value}) {
    if (GetUtils.isBlank(value)!)
      return false;
    else
      return true;
  }

  static String? validateUserName({required String name}) {
    if (name.isEmpty) {
      return 'الرجاء أدخل الإسم كامل';
    } else {
      return null;
    }
  }

  static String? validatePhone({required String phone}) {
    if (phone.isEmpty) {
      return 'أدخل رقم الهاتف';
    } else {
      return null;
    }
  }

  static String? validatePassword({required String password}) {
    if (GetUtils.isBlank(password)!) {
      return 'enter_password'.tr;
    } else if (password.length < 6) {
      return 'validate_password'.tr;
    } else
      return null;
  }

  static String? validateConfirmPassword(
      {required String password, required String conformPassword}) {
    if (GetUtils.isBlank(conformPassword)!)
      return 'Enter Confirm Password'.tr;
    else if (conformPassword.length < 6)
      return 'Password must be more than 6 characters'.tr;
    else if (password != conformPassword) return 'Passwords do not match'.tr;
    return null;
  }

  static String? validateEmail({required email}) {
    if (GetUtils.isBlank(email)!)
      return 'enter email'.tr;
    else if (!AppHelper.emailValidate().hasMatch(email))
      return 'Enter a valid email'.tr;
    else
      return null;
  }

  static String formatImage(String pathImage) {
    if(pathImage.contains('\\'))
      return pathImage.replaceAll('\\', '/');
    else
      return pathImage;
  }

  static String getUserImage(String pathImage) {
    // print('getUserImage: $pathImage');
    if(pathImage.contains(Const.imagePath))
      return formatImage(pathImage);
    else
      return formatImage('${Const.imagePath}$pathImage');
  }

  static Uint8List getBinaryImage({required String image}) {
    // String image = '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';
    return base64Decode(image);
  }

  static int getColorItemSize() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 550 ? /* TODO PHONE */ 9 : /* TODO TABLET */ 14;
  }

  static int getGridItemSize() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 550 ? /* TODO PHONE */ 2 : /* TODO TABLET */ 3;
  }

  static double getDialogSize() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 550 ? /* TODO PHONE */ 250 : /* TODO TABLET */ 280;
  }

  static double getDialogLanguageSize() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 550 ? /* TODO PHONE */ 210 : /* TODO TABLET */ 280;
  }

  static double getBottomSheetSize() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 550 ? /* TODO PHONE */ 320 : /* TODO TABLET */ 380;
  }

  static void showDoneSaleDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (con) => AlertDialog(
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            height: 380.h,
            width: 300,
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsetsDirectional.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Container(
                    margin: EdgeInsets.only(top: 8.r),
                    height: 150.h,
                    width: 230.w,
                    child: Image.asset('${Const.images}done_slae.png', fit: BoxFit.scaleDown)),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r, top: 8.r),
                  child: AppText.medium(text:
                  'تم الطلب بنجاح!',
                    color: HexColor(AppColors.mainColor),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r, top: 8.r),
                  child: AppText.medium(text:
                  'لقد قمت بإجراء الطلب بنجاح و إضافة المنتج الى القائمة',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    maxline: 2
                  ),
                ),
                Spacer(),
                Container(
                    margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r, bottom: 20.r),
                    child: AppWidgets.CustomButton(
                      height: 40.h,
                        width: 220.w,
                        text: 'حسناً',
                        background: AppColors.appMainColor,
                        borderColor: AppColors.appMainColor,
                        click: () => Navigator.maybePop(context))),
              ],
            ),
          ),
        ));
  }

  static void showLoginDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (con) => AlertDialog(
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            height: 300.h,
            clipBehavior: Clip.antiAlias,
            padding: EdgeInsetsDirectional.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                  child: AppText.medium(text:
                  'please_login'.tr,
                    color: HexColor(AppColors.mainColor),
                    fontSize: Platform.isAndroid ? 16.sp : 14.sp,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 8.r),
                    height: 150.h,
                    width: 230.w,
                    child: Image.asset('${Const.images}login.png', fit: BoxFit.cover)),
                Spacer(),
                Container(
                    child: AppWidgets.CustomButton(
                        height: 52,
                        background: HexColor(AppColors.mainColor),
                        borderColor: HexColor(AppColors.mainColor),
                        text: 'login'.tr,
                        click: () {
                          goToLogin();
                        })),
              ],
            ),
          ),
        ));
  }

  static void goToLogin() {
    // PreferencesManager.clearData(key: Const.KEY_LATITUDE);
    // PreferencesManager.clearData(key: Const.KEY_LONGITUD);
    // PreferencesManager.clearData(key: Const.KEY_USER_TOKEN);
    // PreferencesManager.clearData(key: Const.KEY_USER_DATA);
    // HomeController controller = Get.put(HomeController());
    // controller.getCurrenNavIndex(navIndex: 0);
    Get.offAndToNamed(Routes.login);
  }

  static void statusBarColor(){
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark));
  }

}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..connectionTimeout
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
