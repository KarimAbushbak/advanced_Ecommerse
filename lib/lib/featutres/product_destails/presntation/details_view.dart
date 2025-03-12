import 'package:advanced_ecommerse/lib/core/resources/manager_font_sizes.dart';
import 'package:advanced_ecommerse/lib/core/resources/manager_font_weight.dart';
import 'package:advanced_ecommerse/lib/core/resources/manager_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/resources/manager_colors.dart';
import '../../../core/resources/manager_height.dart';
import '../../../core/resources/manager_strings.dart';
import '../../../core/resources/manager_width.dart';
import '../../../core/widgets/progress_indicator.dart';
import '../../cart/presntation/controller/cart_controller.dart';
import '../../home/presntation/controller/home_controller.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      final CartController cartController = Get.put(CartController());

      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: ManagerColors.profileIconsColor,
            ),
          ),
          actions: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w14),
                child: IconButton(
                  onPressed: () {
                    cartController.addToCart({
                      "name": controller.homeModel.data.first.name,
                      "price": controller.homeModel.data.first.basePrice,
                      "image": controller.homeModel.data.first.thumbnailImage,
                    });
                    Get.snackbar("تمت الإضافة", "تمت إضافة المنتج إلى السلة",
                        snackPosition: SnackPosition.BOTTOM);
                  },
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.black,
                  ),
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: ManagerHeight.h320,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      controller: PageController(),
                      onPageChanged: (index) {
                        controller.onPageChanged(index);
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            width: ManagerWidth.w268,
                            height: ManagerHeight.h313,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(
                                  controller
                                      .homeModel.data.first.thumbnailImage,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => progressIndicator(
                          color: controller.currentPageIndex.value == 0
                              ? ManagerColors.primaryColor
                              : ManagerColors.transparent,
                          borderColor: ManagerColors.primaryColor)),
                      Obx(() => progressIndicator(
                          color: controller.currentPageIndex.value == 1
                              ? Colors.blue
                              : ManagerColors.transparent,
                          borderColor: Colors.blue)),
                      Obx(() => progressIndicator(
                          color: controller.currentPageIndex.value == 2
                              ? Colors.green
                              : ManagerColors.transparent,
                          borderColor: Colors.green)),
                    ],
                  ),
                  SizedBox(
                    height: ManagerHeight.h28,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.homeModel.data.first.name.toUpperCase(),
                          style: TextStyle(
                              fontSize: ManagerFontSizes.s20,
                              fontWeight: ManagerFontWeight.w800,
                              fontFamily: ManagerFontFamily.appFont),
                        ),
                        Row(
                          children: [
                            Text(
                                controller.homeModel.data.first.basePrice
                                    .toString(),
                                style: TextStyle(
                                    color: ManagerColors.black,
                                    fontFamily: ManagerFontFamily.appFont,
                                    fontSize: ManagerFontSizes.s32,
                                    fontWeight: ManagerFontWeight.bold)),
                            SizedBox(
                              width: ManagerWidth.w4,
                            ),
                            Text("r.s",
                                style: TextStyle(
                                  fontSize: ManagerFontSizes.s16,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h12,
                  ),
                  Text("data"),
                  SizedBox(
                    height: ManagerHeight.h28,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          height: ManagerHeight.h30,
                          width: ManagerWidth.w107,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: Obx(() => DropdownButton<String>(
                                  value: controller.selectedValue.value,
                                  icon: Icon(Icons.arrow_drop_down,
                                      color: Colors.black),
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                  onChanged: (String? newValue) {
                                    controller.changeDropValue(newValue!);
                                  },
                                  items: controller.items
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                )),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                child: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                width: ManagerWidth.w28,
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                ),
                              ),
                              SizedBox(
                                width: ManagerWidth.w28,
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h28,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(ManagerStrings.similarProducts,
                            style: TextStyle(
                                color: ManagerColors.black,
                                fontFamily: ManagerFontFamily.appFont,
                                fontSize: ManagerFontSizes.s20,
                                fontWeight: ManagerFontWeight.bold)),
                      ],
                    ),
                  ),
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
                      return InkWell(
                        onTap: () {
                          controller.productDetails(
                            context,
                            controller.homeModel.data[index].id,
                            controller.homeModel.data[index].thumbnailImage,
                            controller.homeModel.data[index].name,
                            controller.homeModel.data[index].basePrice,
                            controller.homeModel.data[index].photos,
                            controller.homeModel.data[index].unit,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(controller
                                  .homeModel.data[index].thumbnailImage),
                              // Replace with your images
                              fit: BoxFit.cover, // Cover the whole container
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                    shrinkWrap: true,
                    // Prevent unnecessary scrolling
                    physics: NeverScrollableScrollPhysics(),
                  ),
                  SizedBox(height: ManagerHeight.h100),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    // Love (Favorite) Icon
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Color(0xffF5E1EBFF),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.favorite, color: Colors.white),
                        onPressed: () {
                          // Handle favorite action
                        },
                      ),
                    ),

                    // Expanded button to fill remaining space
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              ManagerColors.greensh,
                              ManagerColors.middle,
                              ManagerColors.primaryColor
                            ], // Gradient colors
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            cartController.addToCart({
                              "name": controller.homeModel.data.first.name,
                              "price":
                                  controller.homeModel.data.first.basePrice,
                              "image": controller
                                  .homeModel.data.first.thumbnailImage,
                            });

                            Get.snackbar(ManagerStrings.productAdded,
                                ManagerStrings.productHasBeenAdded,
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: ManagerColors.primaryColor,
                                colorText: Colors.white);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            minimumSize:
                                Size(double.infinity, ManagerHeight.h50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            ManagerStrings.addToCart,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ManagerFontSizes.s18,
                                fontWeight: ManagerFontWeight.bold,
                                fontFamily: ManagerFontFamily.appFont),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
