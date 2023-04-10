import 'package:get/get.dart';
import 'package:medical_services/routes/routes.dart';
import 'package:medical_services/utils/constants.dart';
import 'package:medical_services/utils/preferences_manager.dart';

class SplashController extends GetxController {
  bool? boarding = PreferencesManager.getAppData(key: Const.KEY_BOARDING);

  @override
  void onInit() {
    startApp();
    super.onInit();
  }

  Future startApp() {
    if (boarding != null) {
      return Future.delayed(
          const Duration(seconds: 5), () => Get.offAndToNamed(Routes.home));
    } else {
      return Future.delayed(
          const Duration(seconds: 5), () => Get.offAndToNamed(Routes.boarding));
    }
  }
}
