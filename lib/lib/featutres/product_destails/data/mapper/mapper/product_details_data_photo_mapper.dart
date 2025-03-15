
import 'package:advanced_ecommerse/lib/featutres/product_destails/data/response/details_photos_responser.dart';
import 'package:advanced_ecommerse/lib/featutres/product_destails/presntation/model/details_photo_model.dart';
import 'package:advanced_ecommerse/lib/core/extensions/extensions.dart';
extension ProductDetailsDataPhotoMapper on DetailsPhotosResponse {
  DetailsPhotosModel toDomain() {
    return DetailsPhotosModel(
      variant: variant.onNull(),
      path: path.onNull(),
    );
  }
}
