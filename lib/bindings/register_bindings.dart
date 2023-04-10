
import 'package:get/get.dart';
import 'package:medical_services/controller/register_controller.dart';

class RegisterBinging extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}