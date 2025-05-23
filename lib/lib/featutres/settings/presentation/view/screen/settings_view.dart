import 'package:advanced_ecommerse/lib/featutres/settings/presentation/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_font_sizes.dart';
import '../../../../../core/resources/manager_font_weight.dart';
import '../../../../../core/resources/manager_height.dart';
import '../../../../../core/resources/manager_strings.dart';
import '../../../../../core/resources/manager_width.dart';
import '../../../../home/presntation/controller/home_controller.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return GetBuilder<SettingController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ManagerColors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: ManagerColors.black,
            ),
          ),
          actions: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                child: Icon(
                  Icons.search,
                  color: ManagerColors.black,
                )),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: homeController.pageSelectedIndex.value,
            onTap: homeController.navigateToScreen,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ManagerHeight.h30,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: ManagerFontSizes.s20,
                        color: ManagerColors.primaryColor,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      controller.appSettingsSharedPreferences.userName,
                      style: TextStyle(
                        fontSize: ManagerFontSizes.s20,
                        color: ManagerColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ManagerHeight.h30,
              ),
              Container(
                width: double.infinity,
                height: ManagerHeight.h34,
                color: ManagerColors.primaryColor,
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    ManagerStrings.settings,
                    style: TextStyle(
                      fontSize: ManagerFontSizes.s16,
                      fontWeight: ManagerFontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ManagerHeight.h6,
              ),
              ListTile(
                leading: Obx(() => Text(
                      controller.selectedCountry.value,
                      style: TextStyle(
                        fontSize: ManagerFontSizes.s16,
                        fontWeight: ManagerFontWeight.w400,
                      ),
                    )),
                trailing: Obx(() => PopupMenuButton<String>(
                      icon: Icon(
                        controller.isArrowForwardCountry.value
                            ? Icons.arrow_forward_rounded
                            : Icons
                                .arrow_drop_down_rounded, // Use country icon state
                      ),
                      onOpened: () => controller.toggleCountryIcon(),
                      onCanceled: () => controller.toggleCountryIcon(),
                      onSelected: (String value) {
                        controller.selectCountry(
                            value); // Use country selection method
                      },
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                            value: ManagerStrings.australia,
                            child: Text(ManagerStrings.australia)),
                        PopupMenuItem(
                            value: ManagerStrings.canada,
                            child: Text(ManagerStrings.canada)),
                        PopupMenuItem(
                            value: ManagerStrings.poland,
                            child: Text(ManagerStrings.poland)),
                        PopupMenuItem(
                            value: ManagerStrings.belgium,
                            child: Text(ManagerStrings.belgium)),
                        PopupMenuItem(
                            value: ManagerStrings.qatar,
                            child: Text(ManagerStrings.qatar)),
                      ],
                    )),
                onTap: () {
                  controller.toggleCountryIcon();
                },
              ),
              SizedBox(
                height: ManagerHeight.h6,
              ),
              ListTile(
                leading: Obx(() => Text(
                      controller.selectedLanguage.value,
                      // Use new language state
                      style: TextStyle(
                        fontSize: ManagerFontSizes.s16,
                        fontWeight: ManagerFontWeight.w400,
                      ),
                    )),
                trailing: Obx(() => PopupMenuButton<String>(
                      icon: Icon(
                        controller.isArrowForwardLanguage.value
                            ? Icons.arrow_forward_rounded
                            : Icons
                                .arrow_drop_down_rounded, // Use language icon state
                      ),
                      onOpened: () => controller.toggleLanguageIcon(),
                      onCanceled: () => controller.toggleLanguageIcon(),
                      onSelected: (String value) {
                        controller.selectLanguage(
                            value); // Use language selection method
                      },
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                            value: ManagerStrings.arabic,
                            child: Text(ManagerStrings.arabic)),
                        PopupMenuItem(
                            value: ManagerStrings.english,
                            child: Text(ManagerStrings.english)),
                      ],
                    )),
                onTap: () {
                  controller.toggleLanguageIcon();
                },
              ),
              SizedBox(
                height: ManagerHeight.h6,
              ),
              ListTile(
                leading: Obx(() => Text(
                      controller.selectedGender.value,
                      // Use new language state
                      style: TextStyle(
                        fontSize: ManagerFontSizes.s16,
                        fontWeight: ManagerFontWeight.w400,
                      ),
                    )),
                trailing: Obx(() => PopupMenuButton<String>(
                      icon: Icon(
                        controller.isArrowForwardLanguage.value
                            ? Icons.arrow_forward_rounded
                            : Icons
                                .arrow_drop_down_rounded, // Use language icon state
                      ),
                      onOpened: () => controller.toggleGenderIcon(),
                      onCanceled: () => controller.toggleGenderIcon(),
                      onSelected: (String value) {
                        controller.selectGender(value); // ✅ Correct function
                      },
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                            value: ManagerStrings.male,
                            child: Text(ManagerStrings.male)),
                        PopupMenuItem(
                            value: ManagerStrings.female,
                            child: Text(ManagerStrings.female)),
                      ],
                    )),
                onTap: () {
                  controller.toggleGenderIcon();
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
