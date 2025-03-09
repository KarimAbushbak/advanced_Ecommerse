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
import '../controller/auth_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());

    return GetBuilder<AuthController>(builder: (controller) {
      print(controller.checkboxValue);
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: ManagerWidth.w109,
                        height: ManagerHeight.h100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(ManagerAssets.auth1))),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: ManagerWidth.w88,
                        height: ManagerWidth.w100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(ManagerAssets.auth2))),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: ManagerWidth.w144,
                height: ManagerHeight.h82,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ManagerAssets.auth5))),
              ),
              SizedBox(
                height: ManagerHeight.h40,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w37),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        ManagerStrings.login,
                        style: TextStyle(
                            fontFamily: ManagerFontFamily.appFont,
                            fontSize: ManagerFontSizes.s24,
                            fontWeight: ManagerFontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: ManagerHeight.h16,
                    ),
                    Container(
                      child: Text(
                        ManagerStrings.emailOrPhone,
                        style: TextStyle(
                            fontFamily: ManagerFontFamily.appFont,
                            fontSize: ManagerFontSizes.s20,
                            fontWeight: ManagerFontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: ManagerHeight.h16,
                    ),
                    Container(
                      width: ManagerWidth.w343,
                      height: ManagerHeight.h70,
                      child: TextField(
                        cursorColor: ManagerColors.primaryColor,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              // Rounded corners
                              borderSide: BorderSide.none, // No border
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: ManagerColors.textFieldColor,
                            labelText: ManagerStrings.labelText,
                            labelStyle:
                                TextStyle(color: ManagerColors.secondaryColor)),
                      ),
                    ),
                    SizedBox(
                      height: ManagerHeight.h24,
                    ),
                    Container(
                      child: Text(
                        ManagerStrings.password,
                        style: TextStyle(
                            fontFamily: ManagerFontFamily.appFont,
                            fontSize: ManagerFontSizes.s20,
                            fontWeight: ManagerFontWeight.w400),
                      ),
                    ),
                    Container(
                      width: ManagerWidth.w343,
                      height: ManagerHeight.h70,
                      child: TextField(
                        cursorColor: ManagerColors.primaryColor,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                )),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              // Rounded corners
                              borderSide: BorderSide.none, // No border
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: ManagerColors.textFieldColor,
                            labelText: ManagerStrings.labelText2,
                            labelStyle:
                                TextStyle(color: ManagerColors.secondaryColor)),
                      ),
                    ),
                    SizedBox(
                      height: ManagerHeight.h14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ManagerStrings.forgotPassword,
                          style: TextStyle(
                              fontWeight: ManagerFontWeight.w400,
                              fontSize: ManagerFontSizes.s16,
                              fontFamily: ManagerFontFamily.appFont),
                        ),
                        Row(
                          children: [
                            Text(ManagerStrings.remember),
                            SizedBox(
                              width: ManagerWidth.w4,
                            ),
                            GestureDetector(
                              // Use GestureDetector for better control
                              onTap: () {
                                final controller = Get.find<
                                    AuthController>(); // Ensure controller is found
                                controller
                                    .changeValue(); // Toggle checkbox value
                              },
                              child: Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: controller.checkboxValue
                                      ? Colors.pink
                                      : Colors.white,
                                  border: Border.all(
                                    color: controller.checkboxValue
                                        ? Colors.pink
                                        : Colors.black,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: ManagerHeight.h24,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.homeView);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ManagerColors.transparent,
                    elevation: 0,
                    minimumSize: Size(
                      ManagerWidth.w120,
                      ManagerHeight.h38,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: ManagerColors.elevatedButtonBorderColor,
                          width: 2),
                    ),
                  ),
                  child: Text(ManagerStrings.login)),
              SizedBox(
                height: ManagerHeight.h78,
              ),
              Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: ManagerWidth.w120,
                        height: ManagerHeight.h120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(ManagerAssets.auth3))),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: ManagerWidth.w100,
                        height: ManagerHeight.h120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(ManagerAssets.auth4))),
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: ManagerHeight.h38,
                      right: ManagerWidth.w75,
                      left: ManagerWidth.w75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            ManagerStrings.doNotHaveAnAccount,
                            style: TextStyle(
                                fontSize: ManagerFontSizes.s16,
                                fontFamily: ManagerFontFamily.appFont,
                                fontWeight: ManagerFontWeight.w400),
                          ),
                          GestureDetector(
                            onTap:(){
                              Get.offAllNamed(Routes.registerView);

                            } ,
                            child: Text(
                              ManagerStrings.signUp,
                              style: TextStyle(
                                  fontSize: ManagerFontSizes.s16,
                                  fontFamily: ManagerFontFamily.appFont,
                                  fontWeight: ManagerFontWeight.w400,
                                  color: Colors.green),
                            ),
                          ),
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
