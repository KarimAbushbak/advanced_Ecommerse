import 'package:advanced_ecommerse/lib/core/resources/manager_assets.dart';
import 'package:advanced_ecommerse/lib/core/resources/manager_font_sizes.dart';
import 'package:advanced_ecommerse/lib/core/resources/manager_font_weight.dart';
import 'package:advanced_ecommerse/lib/core/resources/manager_fonts.dart';
import 'package:advanced_ecommerse/lib/core/resources/manager_height.dart';
import 'package:advanced_ecommerse/lib/core/resources/manager_strings.dart';
import 'package:advanced_ecommerse/lib/core/resources/manager_width.dart';
import 'package:advanced_ecommerse/lib/featutres/home/presntation/controller/home_controller.dart';
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
          bottomNavigationBar: Obx(
                () => BottomNavigationBar(
              currentIndex: controller.selectedIndex.value,
              onTap: controller.navigateToScreen, // Directly call the function
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
                      controller.appSettingsSharedPreferences.userName,
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
          body: SingleChildScrollView(
            child: Column(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: ManagerWidth.w182,
                      child: Obx(
                        () => TabBar(
                          onTap: controller.changeMale,
                          indicatorColor: controller.isMale.value
                              ? Colors.blue
                              : Colors.pink,
                          labelColor: Colors.black,
                          tabs: [
                            Tab(text: ManagerStrings.men),
                            Tab(text: ManagerStrings.women),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ManagerHeight.h8,
                ),
                Container(
                  height: ManagerHeight.h80,
                  child: TabBarView(
                    children: [
                      CategoryListView(categories: [
                        CategoryItem(ManagerStrings.clothes,
                            ManagerAssets.home7, Colors.blue),
                        CategoryItem(ManagerStrings.bags, ManagerAssets.home8,
                            Colors.blue),
                        CategoryItem(ManagerStrings.shoes, ManagerAssets.home9,
                            Colors.blue),
                        CategoryItem(ManagerStrings.accessory,
                            ManagerAssets.home10, Colors.blue),
                        CategoryItem(ManagerStrings.brand, ManagerAssets.home11,
                            Colors.blue),
                        CategoryItem(ManagerStrings.clothes,
                            ManagerAssets.home7, Colors.blue),
                      ]),

                      // Women's Category (نساء)
                      CategoryListView(categories: [
                        CategoryItem(ManagerStrings.dress, ManagerAssets.home2,
                            Colors.pink),
                        CategoryItem(ManagerStrings.clothes,
                            ManagerAssets.home7, Colors.pink),
                        CategoryItem(ManagerStrings.bags, ManagerAssets.home4,
                            Colors.pink),
                        CategoryItem(ManagerStrings.shoes, ManagerAssets.home5,
                            Colors.pink),
                        CategoryItem(ManagerStrings.brand, ManagerAssets.home6,
                            Colors.pink),
                        CategoryItem(ManagerStrings.dress, ManagerAssets.home2,
                            Colors.pink),
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h20,
                ),
                Obx(() => Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: ManagerWidth.w16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                ManagerStrings.seasonNew,
                                style: TextStyle(
                                    fontFamily: ManagerFontFamily.appFont,
                                    fontWeight: ManagerFontWeight.bold,
                                    fontSize: ManagerFontSizes.s20),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: ManagerHeight.h50,
                          child: Container(
                            width: ManagerWidth.w470,
                            height: ManagerHeight.h161,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(ManagerAssets.home16))),
                          ),
                        ),
                        controller.isMale.value
                            ? Row(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: ManagerHeight.h20),
                                    width: ManagerWidth.w68,
                                    height: ManagerHeight.h190,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                ManagerAssets.home13))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: ManagerHeight.h20),
                                    width: ManagerWidth.w86,
                                    height: ManagerHeight.h200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                ManagerAssets.home12))),
                                  ),
                                  SizedBox(
                                    width: ManagerWidth.w10,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: ManagerHeight.h40),
                                    width: ManagerWidth.w85,
                                    height: ManagerHeight.h110,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                ManagerAssets.home14))),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: ManagerHeight.h30),
                                    width: ManagerWidth.w125,
                                    height: ManagerHeight.h155,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                ManagerAssets.home15))),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: ManagerHeight.h20),
                                    width: ManagerWidth.w86,
                                    height: ManagerHeight.h190,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                ManagerAssets.home17))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: ManagerHeight.h100),
                                    width: ManagerWidth.w80,
                                    height: ManagerHeight.h80,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                ManagerAssets.home18))),
                                  ),
                                  Container(
                                    width: ManagerWidth.w80,
                                    height: ManagerHeight.h70,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                ManagerAssets.home19))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: ManagerHeight.h100),
                                    width: ManagerWidth.w140,
                                    height: ManagerHeight.h100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                ManagerAssets.home20))),
                                  ),
                                ],
                              )
                      ],
                    )),
                SizedBox(
                  height: ManagerHeight.h5,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ManagerStrings.shopFromBestSeller,
                        style: TextStyle(
                            fontFamily: ManagerFontFamily.appFont,
                            fontSize: ManagerFontSizes.s16,
                            fontWeight: ManagerFontWeight.bold),
                      ),
                      Text(
                        ManagerStrings.viewAll,
                        style: TextStyle(
                            fontFamily: ManagerFontFamily.appFont,
                            fontSize: ManagerFontSizes.s16,
                            fontWeight: ManagerFontWeight.regular),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h5,
                ),
                // print(controller.homeModel.data.first.name),

                Container(
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      itemCount: controller.homeModel.data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      controller
                                          .homeModel.data[index].thumbnailImage,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                controller.homeModel.data[index].name,
                                style: TextStyle(
                                    fontWeight: ManagerFontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(controller.homeModel.data[index].unit),
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 100,
                    width: 400,
                    decoration: BoxDecoration(color: ManagerColors.bannerColor),
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Text(
                            ManagerStrings.shopForTheFirstTime,
                            style: TextStyle(
                                fontSize: ManagerFontSizes.s24,
                                fontWeight: ManagerFontWeight.w800,
                                color: ManagerColors.white,
                                fontFamily: ManagerFontFamily.appFont),
                          ),
                          Text(
                            ManagerStrings.andGet,
                            style: TextStyle(
                                fontSize: ManagerFontSizes.s24,
                                fontWeight: ManagerFontWeight.w800,
                                color: ManagerColors.white,
                                fontFamily: ManagerFontFamily.appFont),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
                    child: Text(
                      "The Best Offer for your Area",
                      style: TextStyle(
                          fontSize: ManagerFontSizes.s16,
                          fontWeight: ManagerFontWeight.w800),
                    )),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 columns
                    crossAxisSpacing: 10, // Space between columns
                    mainAxisSpacing: 10, // Space between rows
                  ),
                  padding: EdgeInsets.all(10),
                  itemCount: 4,
                  // Only 4 images
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              controller.homeModel.data[index].thumbnailImage),
                          // Replace with your images
                          fit: BoxFit.cover, // Cover the whole container
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                  shrinkWrap: true,
                  // Prevent unnecessary scrolling
                  physics: NeverScrollableScrollPhysics(),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
