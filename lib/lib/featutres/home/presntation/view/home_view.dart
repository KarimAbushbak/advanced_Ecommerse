import 'package:advanced_ecommerse/lib/core/resources/manager_assets.dart';
import 'package:advanced_ecommerse/lib/core/resources/manager_height.dart';
import 'package:advanced_ecommerse/lib/core/resources/manager_strings.dart';
import 'package:advanced_ecommerse/lib/core/resources/manager_width.dart';
import 'package:advanced_ecommerse/lib/featutres/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/manager_colors.dart';
import '../widgets/CategoryGridView.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0, // Remove shadow for a clean look
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 42,
                      height: 42,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(ManagerAssets.home22),
                      ),
                    ),
                    Text(
                      "مرحبا,لينا",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w16,
                      vertical: ManagerHeight.h20),
                  width: ManagerWidth.w72,
                  height: ManagerHeight.h40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ManagerAssets.home1),
                      fit: BoxFit
                          .contain, // Ensures the image is properly displayed
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: ManagerHeight.h24,
              ),
              Container(
                  width: 350,
                  height: 28,
                  child: Obx(() => TextField(
                        cursorColor: ManagerColors.primaryColor,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: controller.isMale.value
                                ? Colors.blue
                                : ManagerColors
                                    .primaryColor, // Change color based on isMale
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none, // No border
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: controller.isMale.value
                              ? ManagerColors.maleTextFieldColor
                              : ManagerColors.textFieldColor,
                          labelText: ManagerStrings.labelText,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelStyle:
                              TextStyle(color: ManagerColors.secondaryColor),
                        ),
                      ))),
              SizedBox(
                height: ManagerHeight.h22,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                width: 396,
                height: 98,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(ManagerAssets.home21))),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 180,
                  child: Obx(
                    () => TabBar(
                      onTap: controller.changeMale,
                      // No need for parentheses
                      indicatorColor:
                          controller.isMale.value ? Colors.blue : Colors.pink,
                      labelColor: Colors.black,
                      tabs: [
                        Tab(text: ManagerStrings.men),
                        Tab(text: ManagerStrings.women),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  CategoryListView(categories: [
                    CategoryItem(ManagerStrings.clothes, ManagerAssets.home7,
                        Colors.blue),
                    CategoryItem(
                        ManagerStrings.bags, ManagerAssets.home8, Colors.blue),
                    CategoryItem(
                        ManagerStrings.shoes, ManagerAssets.home9, Colors.blue),
                    CategoryItem(ManagerStrings.accessory, ManagerAssets.home10,
                        Colors.blue),
                    CategoryItem(ManagerStrings.brand, ManagerAssets.home11,
                        Colors.blue),
                    CategoryItem(ManagerStrings.clothes, ManagerAssets.home7,
                        Colors.blue),
                  ]),

                  // Women's Category (نساء)
                  CategoryListView(categories: [
                    CategoryItem(
                        ManagerStrings.dress, ManagerAssets.home2, Colors.pink),
                    CategoryItem(ManagerStrings.clothes, ManagerAssets.home7,
                        Colors.pink),
                    CategoryItem(
                        ManagerStrings.bags, ManagerAssets.home4, Colors.pink),
                    CategoryItem(
                        ManagerStrings.shoes, ManagerAssets.home5, Colors.pink),
                    CategoryItem(
                        ManagerStrings.brand, ManagerAssets.home6, Colors.pink),
                    CategoryItem(
                        ManagerStrings.dress, ManagerAssets.home2, Colors.pink),
                  ]),
                ],
              ))
            ],
          ),
        ),
      );
    });
  }
}
