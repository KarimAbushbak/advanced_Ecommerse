import 'package:advanced_ecommerse/lib/core/constants.dart';
import 'package:advanced_ecommerse/lib/core/widgets/helpers.dart';
import 'package:advanced_ecommerse/lib/featutres/product_destails/data/mapper/mapper/product_details_mapper.dart';
import 'package:advanced_ecommerse/lib/featutres/product_destails/data/response/details_response.dart';
import 'package:advanced_ecommerse/lib/featutres/product_destails/presntation/model/details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailsApiController with Helpers {
  Future get({
    required String endPoint,
    required Map<String, String> header,
  }) async {
    return await http.get(
      Uri.parse(endPoint),
      headers: header,
    );
  }

  Future<DetailsModel> details(
      {required BuildContext context, required int productId}) async {
    http.Response response = await get(
      endPoint: ApiRequest.productDetails(productId),
      header: {},
    );

    int statusCode = response.statusCode;

    if (statusCode >= 200 && statusCode < 300) {
      var json = jsonDecode(response.body);

      return DetailsResponse.fromJson(json).toDomain();
    } else if (statusCode >= 400 && statusCode < 500) {
      var json = jsonDecode(response.body);
      return DetailsModel(
        data: [],
        success: json['success'],
        status: json['status'],
      );
    } else if (statusCode >= 500 && statusCode < 600) {
      return DetailsModel(
        data: [],
        success: false,
        status: 500,
      );
    }

    showSnackBar(
      context: context,
      message: 'Something Went Error',
      error: true,
    );
    return DetailsModel(
      data: [],
      success: false,
      status: 404,
    );
  }
}
