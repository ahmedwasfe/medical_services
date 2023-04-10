
import 'package:get/get.dart';
import 'package:medical_services/bindings/login_bindings.dart';
import 'package:medical_services/bindings/register_bindings.dart';
import 'package:medical_services/ui/auth/login_screen.dart';
import 'package:medical_services/ui/auth/register_screen.dart';
import 'package:medical_services/ui/boarding_screen.dart';
import 'package:medical_services/ui/home/home_screen.dart';
import 'package:medical_services/ui/home/search_screen.dart';
import 'package:medical_services/ui/product_details/product_details_screen.dart';
import 'package:medical_services/ui/profile/edit_prodile_screen.dart';
import 'package:medical_services/ui/section/products_screen.dart';
import 'package:medical_services/ui/section/sub_sections_screen.dart';
import 'package:medical_services/ui/settings/about_us_screen.dart';
import 'package:medical_services/ui/settings/change_password_screen.dart';
import 'package:medical_services/ui/settings/contact_us_screen.dart';
import 'package:medical_services/ui/settings/help_screen.dart';
import 'package:medical_services/ui/settings/privacy_screen.dart';
import 'package:medical_services/ui/splash_screen.dart';

class AppRoutes {

    static final routesPages = [
    GetPage(name: Routes.splash, page: () => SplashScreen()),
    GetPage(name: Routes.boarding, page: () => BoardingScreen()),
    GetPage(name: Routes.login, page: () => LoginScreen(), binding: LoginBinging()),
    GetPage(name: Routes.register, page: () => RegisterScreen(), binding: RegisterBinging()),
      GetPage(name: Routes.home, page: () => HomeScreen()),
    GetPage(name: Routes.search, page: () => SearchScreen()),
      GetPage(name: Routes.subSection, page: () => SubSectionsScreen()),
    GetPage(name: Routes.products, page: () => ProductsScreen()),
    GetPage(name: Routes.productDetails, page: () => ProductDetailsScreen()),
    GetPage(name: Routes.editProfile, page: () => EditProfileScreen()),
    GetPage(name: Routes.changePassword, page: () => ChangePasswordScreen()),
    GetPage(name: Routes.aboutUs, page: () => AboutUsScreen()),
    GetPage(name: Routes.contactUs, page: () => ContactUsScreen()),
    GetPage(name: Routes.privacyPolicy, page: () => PrivacyScreen()),
    GetPage(name: Routes.help, page: () => HelpScreen()),
  ];

}

 class Routes{
  static const splash = '/splash';
  static const boarding = '/boarding';
  static const login = '/login';
  static const register = '/register';
  static const doneRegistration = '/done_register';
  static const home = '/home';
  static const search = '/search';
  static const products = '/products';
  static const subSection = '/sub_section';
  static const productDetails = '/product_details';
  static const editProfile = '/edit_profile';
  static const changePassword = '/change_password';
  static const contactUs = '/contact_us';
  static const aboutUs = '/about_us';
  static const privacyPolicy ='/privacy_policy';
  static const help ='/help';

}