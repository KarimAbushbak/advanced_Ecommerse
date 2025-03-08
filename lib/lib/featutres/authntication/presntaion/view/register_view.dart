import 'package:advanced_ecommerse/lib/featutres/authntication/presntaion/view/registration_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_font_sizes.dart';
import '../../../../core/resources/manager_font_weight.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_width.dart';
import '../../../../core/routes.dart';
class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
              TabBar(
                indicatorColor: Colors.blue,
                labelColor: ManagerColors.black,
                tabs: [
                  Tab(text: ManagerStrings.email,),
                  Tab(text: ManagerStrings.phoneNumber),
                ],
              ),
              SizedBox(height: 16),
              Container(
                height: ManagerHeight.h490,
                child: TabBarView(
                  children: [
                    RegistrationForm(isEmailTab: true),
                    RegistrationForm(isEmailTab: false),
                  ],
                ),
              ),
              SizedBox(
                height: ManagerHeight.h12,
              ),
              ElevatedButton(
                  onPressed: () {},
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
                  child: Text(
                      ManagerStrings.signUp,
                    style: TextStyle(
                      color: ManagerColors.black,
                      fontFamily: ManagerFontFamily.appFont
                    ),
                  ),
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
                        children: [
                          Text(
                            ManagerStrings.haveAnAccount,
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
                              ManagerStrings.login,
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
      ),
    );
  }
}
