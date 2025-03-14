import 'package:advanced_ecommerse/lib/featutres/product_destails/presntation/model/details_brand_model.dart';
import 'package:advanced_ecommerse/lib/featutres/product_destails/presntation/model/details_choice_options_model.dart';
import 'package:advanced_ecommerse/lib/featutres/product_destails/presntation/model/details_photo_model.dart';

class DetailsDataModel {
  int id;
  String name;
  String addedBy;
  int sellerId;
  int shopId;
  String shopName;
  String shopLogo;
  List<DetailsPhotosModel> photos;
  String thumbnailImage;
  List<String> tags;
  List<DetailsChoiceOptionsModel> choiceOptions;
  List<String> colors;
  bool hasDiscount;
  String strokedPrice;
  String mainPrice;
  int calculablePrice;
  String currencySymbol;
  int currentStock;
  String unit;
  int rating;
  int ratingCount;
  int earnPoint;
  String description;
  String videoLink;
  DetailsBrandModel brand;
  String link;

  DetailsDataModel(
      {
       required this.id,
       required this.name,
       required this.addedBy,
       required this.sellerId,
       required this.shopId,
       required this.shopName,
       required this.shopLogo,
       required this.photos,
       required this.thumbnailImage,
       required this.tags,
       required this.choiceOptions,
       required this.colors,
       required this.hasDiscount,
       required this.strokedPrice,
       required this.mainPrice,
       required this.calculablePrice,
       required this.currencySymbol,
       required this.currentStock,
       required this.unit,
       required this.rating,
       required this.ratingCount,
       required this.earnPoint,
       required this.description,
       required this.videoLink,
       required this.brand,
       required this.link});


}
