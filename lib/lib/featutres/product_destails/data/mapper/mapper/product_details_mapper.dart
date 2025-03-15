import 'package:advanced_ecommerse/lib/featutres/product_destails/data/mapper/mapper/product_details_data_mapper.dart';

import '../../../presntation/model/details_model.dart';
import '../../response/details_response.dart';

import 'package:advanced_ecommerse/lib/core/extensions/extensions.dart';

extension DetailsMapper on DetailsResponse {
  DetailsModel toDomain() {
    return DetailsModel(
      data: data!.map((e) => e.toDomain()).toList(),
      success: success.onNull(),
      status: status.onNull(),
    );
  }
}
