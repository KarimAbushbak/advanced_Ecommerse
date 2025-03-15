import 'package:advanced_ecommerse/lib/featutres/product_destails/data/data_source/details_api_controller.dart';
import 'package:advanced_ecommerse/lib/featutres/product_destails/presntation/model/details_model.dart';
import 'package:advanced_ecommerse/lib/featutres/product_destails/presntation/model/details_photo_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/manager_strings.dart';
import '../../../../core/routes.dart';

class DetailsController extends GetxController {
  var selectedValue = ManagerStrings.size.obs;

  DetailsModel productDetailsModel =
      DetailsModel(data: [], success: true, status: 200);
  DetailsApiController detailsApiController = DetailsApiController();
  var currentPageIndex = 0.obs;
  var items = <String>[].obs;

  void onInit() {
    super.onInit();
  }

  readDetails(int productID,  BuildContext context,) async {
    productDetailsModel = await detailsApiController.details(
        context: Get.context!, productId: productID);
    Navigator.pushNamed(context, Routes.detailsView);

    update();
  }

  productDetails(
      BuildContext context,
      int productId,
      String productImg,
      String productName,
      int productPrice,
      List<DetailsPhotosModel> photos,
      String unit) {
    productDetailsModel.data.first.id = productId;
    productDetailsModel.data.first.thumbnailImage = productImg;
    productDetailsModel.data.first.name = productName;
    productDetailsModel.data.first.calculablePrice = productPrice;
    productDetailsModel.data.first.photos = photos;
    productDetailsModel.data.first.unit = unit;
    Navigator.pushNamed(context, Routes.detailsView);
  }

  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }

  void changeDropValue(String newValue) {
    selectedValue.value = newValue;
  }
}
