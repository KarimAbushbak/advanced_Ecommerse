
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import '../featutres/authntication/presntaion/controller/auth_controller.dart';
import '../featutres/home/presntation/controller/home_controller.dart';
import '../featutres/splash/presntation/controller/splash_controller.dart';

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSettingsSharedPreferences().initPreferences();
}
initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}
initAuth() {
  disposeSplash();

  Get.put<AuthController>(AuthController());
}
//
// disposeAuth() {
//   Get.delete<AuthController>();
// }
initHome() {
  disposeSplash();

  Get.put<HomeController>(HomeController());
}
// initLocale(){
//   Get.put<LocaleNotifierController>(LocaleNotifierController());
// }}
