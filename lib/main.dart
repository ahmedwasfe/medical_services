import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medical_services/bindings/app_bindings.dart';
import 'package:medical_services/routes/routes.dart';
import 'package:medical_services/utils/app_helper.dart';

import 'utils/preferences_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppHelper.initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          locale: Locale('ar'),
          initialBinding: AppBindings(),
          initialRoute: Routes.splash,
          getPages: AppRoutes.routesPages,
        )
    );
  }
}
