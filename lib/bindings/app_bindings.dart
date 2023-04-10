
import 'package:get/get.dart';
import 'package:medical_services/controller/boarding_controller.dart';
import 'package:medical_services/controller/home_controller.dart';
import 'package:medical_services/controller/splash_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(BoardingController());
    Get.lazyPut(() => HomeController());
    // Get.put(SettingsController());
  }
}
