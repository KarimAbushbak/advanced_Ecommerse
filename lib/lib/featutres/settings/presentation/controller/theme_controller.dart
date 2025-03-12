import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // This stores the current theme state.
  var isDarkMode = false.obs;

  // Toggles the theme and saves the state.
  void toggleTheme() {

    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
