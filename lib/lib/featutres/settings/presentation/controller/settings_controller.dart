import 'package:get/get.dart';

import '../../../../core/routes.dart';

class SettingsController extends GetxController{
  var pageSelectedIndex = 0.obs;

  final Map<int, String> routes = {
    0: Routes.cartView,
    1: Routes.brandView,
    2: Routes.homeView,
    3: Routes.settingsView,
    4: Routes.profileView, // Profile tab
  };

  void navigateToScreen(int index) {
    pageSelectedIndex.value = index;
    Get.toNamed(routes[index]!);
  }
}