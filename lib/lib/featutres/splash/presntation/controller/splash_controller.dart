import 'package:get/get.dart';

import '../../../../core/constants.dart';
import '../../../../core/routes.dart';
class SplashController extends GetxController {

  void onInit() {
    super.onInit();
    // appSettingsSharedPreferences.clear();
    Future.delayed(
        Duration(
          seconds: Constants.splashTime,
        ), () {
      // appSettingsSharedPreferences.clear();

      Get.offAllNamed(Routes.outBoarding);
    });
  }
}
