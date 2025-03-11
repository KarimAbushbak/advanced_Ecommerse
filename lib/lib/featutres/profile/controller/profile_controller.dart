import 'package:advanced_ecommerse/lib/core/resources/manager_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../core/routes.dart';
import '../../../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';


class ProfileController extends GetxController{
  AppSettingsSharedPreferences appSettingsSharedPreferences =
  AppSettingsSharedPreferences();
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

  void showEditDialog(BuildContext context) {
    TextEditingController usernameController =
    TextEditingController(text: appSettingsSharedPreferences.userName);

    Get.dialog(
      AlertDialog(
        title: Text(ManagerStrings.editName),
        content: TextField(
          controller: usernameController,
          decoration: InputDecoration(
            labelText: ManagerStrings.newName,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(ManagerStrings.cancel),
          ),
          TextButton(
            onPressed: () async {
              await updateUserName(usernameController.text);
              Get.back();
            },
            child: Text(ManagerStrings.save),
          ),
        ],
      ),
    );
  }

  Future<void> updateUserName(String newName) async {
    await appSettingsSharedPreferences.setUserName(newName); // Store persistently
    update(); // Refresh UI
  }
  void logout() async {
    print("Logout button clicked!"); // Debugging

    await appSettingsSharedPreferences.clear();
    Get.offAllNamed(Routes.loginView);;

  }




}