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

import '../../../../core/routes.dart';
import '../../../../core/widgets/base_button.dart';

class OutBoardingView extends StatelessWidget {
  const OutBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topLeft,
                    image: AssetImage(ManagerAssets.outBoarding1))),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w37, vertical: ManagerHeight.h20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    ManagerStrings.signUp,
                    style: TextStyle(
                        fontSize: ManagerFontSizes.s16,
                        fontWeight: ManagerFontWeight.w600),
                  ),
                ),
                Container(
                  width: ManagerWidth.w72,
                  height: ManagerHeight.h40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ManagerAssets.outBoardingLogo))),
                )
              ],
            ),
          ),
          Positioned(
            top: ManagerHeight.h60,  // Moves the widget down
            right: ManagerWidth.w230, // Moves it from the right
            left: ManagerWidth.w100,  // Moves it from the left
            child: Container(
              width: ManagerWidth.w35,
              height: ManagerHeight.h35,
              child: CircleAvatar(
                backgroundImage: AssetImage(ManagerAssets.outBoarding4),
              ),
            ),
          ),
          Positioned(
            top: ManagerHeight.h68,
            left: 0,
            child: Container(
              width: ManagerWidth.w100, // Adjust as needed
              height: ManagerHeight.h100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage(
                    ManagerAssets.outBoarding2
                  )
                )
              ),
            ),
          ),
          Positioned(
            top: ManagerHeight.h168,
            left: ManagerWidth.w90,
            right: ManagerWidth.w182,
            child: Container(
              width: ManagerWidth.w155, // Adjust as needed
              height: ManagerHeight.h155,
              child: CircleAvatar(
                backgroundImage: AssetImage(ManagerAssets.outBoarding3),
              ),
            ),
          ),
          Positioned(
            top: ManagerHeight.h225,
            left: ManagerWidth.w281,
            // right: ManagerWidth.w107,
            child: Container(
              width: ManagerWidth.w40, // Adjust as needed
              height: ManagerHeight.h40,
              child: CircleAvatar(
                backgroundImage: AssetImage(ManagerAssets.outBoarding6),
              ),
            ),
          ),
          Positioned(
            top: ManagerHeight.h313,
            left: ManagerWidth.w20,
            // right: ManagerWidth.w107,
            child: Container(
              width: ManagerWidth.w40, // Adjust as needed
              height: ManagerHeight.h40,
              child: CircleAvatar(
                backgroundImage: AssetImage(ManagerAssets.outBoarding9),
              ),
            ),
          ),
          Positioned(
            top: ManagerHeight.h350,
            left: ManagerWidth.w144,
            // right: ManagerWidth.w107,
            child: Container(
              width: ManagerWidth.w100, // Adjust as needed
              height: ManagerHeight.h100,
              child: CircleAvatar(
                backgroundImage: AssetImage(ManagerAssets.outBoarding8),
              ),
            ),
          ),
          Positioned(
            top: ManagerHeight.h108,
            right: 0,
            // right: ManagerWidth.w107,
            child: Container(
              width: ManagerWidth.w60, // Adjust as needed
              height: ManagerHeight.h60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.centerRight,
                  image: AssetImage(
                    ManagerAssets.outBoarding5
                  )
                )
              ),
            ),
          ),
          Positioned(
            top: ManagerHeight.h303,
            right: 0,
            // right: ManagerWidth.w107,
            child: Container(
              width: ManagerWidth.w100, // Adjust as needed
              height: ManagerHeight.h100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.centerRight,
                  image: AssetImage(
                    ManagerAssets.outBoarding7
                  )
                )
              ),
            ),
          ),
          Positioned(
            top: ManagerHeight.h500,
            right: ManagerWidth.w68,
            left: ManagerWidth.w101,
            // right: ManagerWidth.w107,
            child: Container(
              child: Text(
                ManagerStrings.outBoarding1,
                style: TextStyle(
                  fontSize: ManagerFontSizes.s40,
                  fontWeight: ManagerFontWeight.bold,
                  fontFamily: ManagerFontFamily.appFont
                ),
              ),


            ),
          ),
          Positioned(
            top:ManagerHeight.h630,
            right: 0,
            left: 0,

            child: Container(
              alignment: Alignment.center,
              child: Text(
                ManagerStrings.outBoarding2,
                style: TextStyle(
                  fontSize: ManagerFontSizes.s16,
                  fontWeight: ManagerFontWeight.w400,
                  fontFamily: ManagerFontFamily.appFont,
                  color: ManagerColors.outBoardingTextColor
                ),
              ),


            ),
          ),
          Positioned(
            top:ManagerHeight.h680,
            right: 0,
            left: 0,

            child: Container(
              alignment: Alignment.center,
              child: BaseButton(onPressed: (){
                Get.offAllNamed(Routes.loginView);

              },


            ),
          ),



          )],
      ),
    );
  }
}
