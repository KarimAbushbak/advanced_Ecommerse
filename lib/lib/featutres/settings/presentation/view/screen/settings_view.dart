import 'package:advanced_ecommerse/lib/featutres/settings/presentation/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/resources/manager_strings.dart';
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.red,
          bottomNavigationBar: Obx(
                () => BottomNavigationBar(
              currentIndex: controller.pageSelectedIndex.value,
              onTap: controller.navigateToScreen,
              // Directly call the function
              selectedItemColor: Colors.blueAccent,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_shopping_cart),
                  label: ManagerStrings.cart,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_activity_outlined),
                  label: ManagerStrings.brand,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: ManagerStrings.home,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: ManagerStrings.settings,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: ManagerStrings.profile,
                ),
              ],
            ),
          ),

        );
      }
    );
  }
}
