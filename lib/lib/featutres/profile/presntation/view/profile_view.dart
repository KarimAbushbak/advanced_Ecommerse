import 'package:advanced_ecommerse/lib/featutres/profile/controller/profile_controller.dart';
import 'package:advanced_ecommerse/lib/featutres/settings/presentation/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_font_sizes.dart';
import '../../../../core/resources/manager_font_weight.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_width.dart';
import '../../../../core/routes.dart';
import '../../../home/presntation/controller/home_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    final SettingController settingController = Get.put(SettingController());


    return GetBuilder<ProfileController>(builder: (controller) {
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
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
                  child: Text(
                    "الصفحة الشخصية",
                    style: TextStyle(
                        fontFamily: ManagerFontFamily.appFont,
                        fontSize: ManagerFontSizes.s24,
                        fontWeight: ManagerFontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: ManagerHeight.h24),
            Container(
              margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Obx(() => Container(
                        width: 140,
                        height: 140,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            settingController.selectedGender.value == ManagerStrings.male
                                ? ManagerAssets.home23
                                : ManagerAssets.home22,
                          ),
                        ),
                      )),
                      SizedBox(
                        height: ManagerHeight.h16,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.showEditDialog(context);
                            },
                            child: Icon(Icons.edit, color: Colors.grey),
                          ),
                          Text(
                            ManagerStrings.edit,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: ManagerFontSizes.s16,
                                fontFamily: ManagerFontFamily.appFont),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(height: ManagerHeight.h5),
                      Text(controller.appSettingsSharedPreferences.userEmail,
                          style: TextStyle(
                              color: ManagerColors.black,
                              fontFamily: ManagerFontFamily.appFont,
                              fontSize: ManagerFontSizes.s20)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ManagerHeight.h14,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w10, vertical: 5),
              width: double.infinity,
              height: ManagerHeight.h30,
              color: ManagerColors.maleTextFieldColor,
              child: Text(
                ManagerStrings.contactUs,
                style: TextStyle(
                    fontSize: ManagerFontSizes.s16,
                    fontWeight: ManagerFontWeight.w400,
                    fontFamily: ManagerFontFamily.appFont),
              ),
            ),
            ListTile(
              leading: Text(
                ManagerStrings.helpCenter,
                style: TextStyle(
                    fontFamily: ManagerFontFamily.appFont,
                    fontWeight: ManagerFontWeight.regular,
                    fontSize: ManagerFontSizes.s16),
              ),
              trailing: Icon(
                Icons.arrow_forward,
              ),
            ),
            ListTile(
              leading: Text(
                ManagerStrings.callUs,
                style: TextStyle(
                    fontFamily: ManagerFontFamily.appFont,
                    fontWeight: ManagerFontWeight.regular,
                    fontSize: ManagerFontSizes.s16),
              ),
              trailing: Icon(
                Icons.arrow_forward,
              ),
            ),
            ListTile(
              leading: Text(
                ManagerStrings.sendEmail,
                style: TextStyle(
                    fontFamily: ManagerFontFamily.appFont,
                    fontWeight: ManagerFontWeight.regular,
                    fontSize: ManagerFontSizes.s16),
              ),
              trailing: Icon(
                Icons.arrow_forward,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ManagerColors.greensh,
                    ManagerColors.middle,
                    ManagerColors.primaryColor
                  ], // Your gradient colors
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ElevatedButton(
                  onPressed: () {
                    controller.logout();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ManagerColors.transparent,
                    elevation: 0,
                    minimumSize: Size(
                      ManagerWidth.w343,
                      ManagerHeight.h40,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: ManagerColors.transparent, width: 2),
                    ),
                  ),
                  child: Text(
                    ManagerStrings.logout,
                    style: TextStyle(color: ManagerColors.black),
                  )),
            ),
          ],
        ),
      );
    });
  }
}
