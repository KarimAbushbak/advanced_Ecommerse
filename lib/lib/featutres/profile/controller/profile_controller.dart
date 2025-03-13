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

    await appSettingsSharedPreferences.clear();
    Get.offAllNamed(Routes.loginView);;

  }




}