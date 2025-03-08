import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_font_sizes.dart';
import '../../../../core/resources/manager_font_weight.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_width.dart';
import '../controller/auth_controller.dart';

class RegistrationForm extends StatelessWidget {
  final bool isEmailTab; // Determines which tab is active

  RegistrationForm({required this.isEmailTab});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w35),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      ManagerStrings.name,
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
                          labelText: ManagerStrings.enterName,
                          labelStyle: TextStyle(color: ManagerColors.secondaryColor)),
                    ),
                  ),
                  Container(
                    child: Text(
                      isEmailTab ? ManagerStrings.email : ManagerStrings.phoneNumber,
                      style: TextStyle(
                          fontFamily: ManagerFontFamily.appFont,
                          fontSize: ManagerFontSizes.s20,
                          fontWeight: ManagerFontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h14,
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
                          labelText: isEmailTab
                              ? ManagerStrings.enterEmail
                              : ManagerStrings.enterPhone,
                          labelStyle: TextStyle(color: ManagerColors.secondaryColor)),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h14,
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
                  SizedBox(
                    height: ManagerHeight.h14,
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
                          labelStyle: TextStyle(color: ManagerColors.secondaryColor)),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h14,
                  ),
                  Container(
                    child: Text(
                      ManagerStrings.confirmPassword,
                      style: TextStyle(
                          fontFamily: ManagerFontFamily.appFont,
                          fontSize: ManagerFontSizes.s20,
                          fontWeight: ManagerFontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h14,
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
                          labelText: ManagerStrings.confirmPassword,
                          labelStyle:
                          TextStyle(color: ManagerColors.secondaryColor)),
                    ),
                  ),
                  Row(

                    children: [


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
                      SizedBox(
                        width: ManagerWidth.w8,
                      ),
                      Text(ManagerStrings.agreeOn),
                      Text(ManagerStrings.terms,style: TextStyle(color: Colors.green),),
                      Text(ManagerStrings.and),
                      Text(ManagerStrings.conditions,style: TextStyle(color: Colors.green),),


                    ],
                  ),

                ],
              ),
            ],
          ),
        );
      }
    );
  }
}
