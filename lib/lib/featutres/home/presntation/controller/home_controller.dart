import 'package:advanced_ecommerse/lib/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/routes.dart';
import '../../data/data_source/home_api_controller.dart';
import '../model/home_model.dart';

class HomeController extends GetxController{
  AppSettingsSharedPreferences appSettingsSharedPreferences= AppSettingsSharedPreferences();
  var isMale = true.obs;
  var selectedIndex = 0.obs;
  HomeModel homeModel = HomeModel(data: [], success: true, status: 200);
  HomeApiController homeApiController = HomeApiController();
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

    // Navigate using the map without an if statement
    Get.toNamed(routes[index]!);
  }

  void onInit() {
    super.onInit();
    readHome();
  }

  readHome() async {
    homeModel = await homeApiController.home(context: Get.context!);
    update();
  }



  void changeMale(int index) {
    isMale.value = index == 0;
  }


  productDetails(
      BuildContext context,
      int productId,
      String productImg,
      String productName,
      double productPrice,
      List<String> photos,
      String unit) {
    homeModel.data.first.id = productId;
    homeModel.data.first.thumbnailImage = productImg;
    homeModel.data.first.name = productName;
    homeModel.data.first.basePrice = productPrice;
    homeModel.data.first.photos = photos;
    homeModel.data.first.unit = unit;
    Navigator.pushNamed(context, Routes.detailsView);
  }



}
