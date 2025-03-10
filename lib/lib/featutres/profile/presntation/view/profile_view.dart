import 'package:advanced_ecommerse/lib/core/resources/manager_colors.dart';
import 'package:advanced_ecommerse/lib/core/resources/manager_font_sizes.dart';
import 'package:advanced_ecommerse/lib/core/resources/manager_font_weight.dart';
import 'package:advanced_ecommerse/lib/core/resources/manager_fonts.dart';
import 'package:advanced_ecommerse/lib/core/resources/manager_height.dart';
import 'package:advanced_ecommerse/lib/core/resources/manager_strings.dart';
import 'package:advanced_ecommerse/lib/core/resources/manager_width.dart';
import 'package:advanced_ecommerse/lib/core/routes.dart';
import 'package:advanced_ecommerse/lib/featutres/home/presntation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../core/resources/manager_assets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Get.toNamed(Routes.homeView);
              },
              icon: Icon(
                Icons.arrow_back,
                color: ManagerColors.profileIconsColor,
              )),
          actions: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w14),
                child: Icon(
                  Icons.search,
                  size: 30,
                  color: ManagerColors.profileIconsColor,
                ))
          ],
        ),
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
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
                  child: Text(
                    "Personal Profile",
                    style: TextStyle(
                        fontFamily: ManagerFontFamily.appFont,
                        fontSize: ManagerFontSizes.s24,
                        fontWeight: ManagerFontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ManagerHeight.h24,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(ManagerAssets.home22),
                    ),
                  ),
                  Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: ManagerStrings.hello,
                                style: TextStyle(
                                    color: ManagerColors.black,
                                    fontFamily: ManagerFontFamily.appFont,
                                    fontSize: ManagerFontSizes.s20)),
                            TextSpan(
                                text: controller
                                    .appSettingsSharedPreferences.userName
                                    .toUpperCase(),
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      SizedBox(height: ManagerHeight.h5,),
                      Text(controller.appSettingsSharedPreferences.userEmail,
                          style: TextStyle(
                              color: ManagerColors.black,
                              fontFamily: ManagerFontFamily.appFont,
                              fontSize: ManagerFontSizes.s20)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
