
import 'package:get/get.dart';
import 'package:medical_services/controller/login_controller.dart';

class LoginBinging extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}