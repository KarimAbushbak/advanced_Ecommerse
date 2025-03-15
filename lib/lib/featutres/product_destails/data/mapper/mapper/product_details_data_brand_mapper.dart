
import 'package:advanced_ecommerse/lib/featutres/product_destails/data/response/details_brand_response.dart';
import 'package:advanced_ecommerse/lib/featutres/product_destails/presntation/model/details_brand_model.dart';
import 'package:advanced_ecommerse/lib/core/extensions/extensions.dart';

extension ProductDetailsDataBrandMapper on DetailsBrandResponse {
  DetailsBrandModel toDomain() {
    return DetailsBrandModel(
      id: id.onNull(),
      name: name.onNull(),
      logo: logo.onNull(),
    );
  }
}
