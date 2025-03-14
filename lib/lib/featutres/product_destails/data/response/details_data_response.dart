import 'package:advanced_ecommerse/lib/featutres/product_destails/data/response/details_brand_response.dart';
import 'package:advanced_ecommerse/lib/featutres/product_destails/data/response/details_choice_options.dart';
import 'package:advanced_ecommerse/lib/featutres/product_destails/data/response/details_photos_responser.dart';

class DetailsDataResponse {
  int? id;
  String? name;
  String? addedBy;
  int? sellerId;
  int? shopId;
  String? shopName;
  String? shopLogo;
  List<DetailsPhotosResponse>? photos;
  String? thumbnailImage;
  List<String>? tags;
  List<DetailsChoiceOptions>? choiceOptions;
  List<String>? colors;
  bool? hasDiscount;
  String? strokedPrice;
  String? mainPrice;
  int? calculablePrice;
  String? currencySymbol;
  int? currentStock;
  String? unit;
  int? rating;
  int? ratingCount;
  int? earnPoint;
  String? description;
  String? videoLink;
  DetailsBrandResponse? brand;
  String? link;

  DetailsDataResponse(
      {this.id,
        this.name,
        this.addedBy,
        this.sellerId,
        this.shopId,
        this.shopName,
        this.shopLogo,
        this.photos,
        this.thumbnailImage,
        this.tags,
        this.choiceOptions,
        this.colors,
        this.hasDiscount,
        this.strokedPrice,
        this.mainPrice,
        this.calculablePrice,
        this.currencySymbol,
        this.currentStock,
        this.unit,
        this.rating,
        this.ratingCount,
        this.earnPoint,
        this.description,
        this.videoLink,
        this.brand,
        this.link});

  DetailsDataResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    addedBy = json['added_by'];
    sellerId = json['seller_id'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopLogo = json['shop_logo'];
    if (json['photos'] != null) {
      photos = <DetailsPhotosResponse>[];
      json['photos'].forEach((v) {
        photos!.add(new DetailsPhotosResponse.fromJson(v));
      });
    }
    thumbnailImage = json['thumbnail_image'];
    tags = json['tags'].cast<String>();
    if (json['choice_options'] != null) {
      choiceOptions = <DetailsChoiceOptions>[];
      json['choice_options'].forEach((v) {
        choiceOptions!.add(new DetailsChoiceOptions.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors = List<String>.from(json['colors']);
    }
    hasDiscount = json['has_discount'];
    strokedPrice = json['stroked_price'];
    mainPrice = json['main_price'];
    calculablePrice = json['calculable_price'];
    currencySymbol = json['currency_symbol'];
    currentStock = json['current_stock'];
    unit = json['unit'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    earnPoint = json['earn_point'];
    description = json['description'];
    videoLink = json['video_link'];
    brand = json['brand'] != null ? new DetailsBrandResponse.fromJson(json['brand']) : null;
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['added_by'] = this.addedBy;
    data['seller_id'] = this.sellerId;
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    data['shop_logo'] = this.shopLogo;
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    data['thumbnail_image'] = this.thumbnailImage;
    data['tags'] = this.tags;
    if (this.choiceOptions != null) {
      data['choice_options'] =
          this.choiceOptions!.map((v) => v.toJson()).toList();
    }
    if (this.colors != null) {
      data['colors'] = this.colors;
    }
    data['has_discount'] = this.hasDiscount;
    data['stroked_price'] = this.strokedPrice;
    data['main_price'] = this.mainPrice;
    data['calculable_price'] = this.calculablePrice;
    data['currency_symbol'] = this.currencySymbol;
    data['current_stock'] = this.currentStock;
    data['unit'] = this.unit;
    data['rating'] = this.rating;
    data['rating_count'] = this.ratingCount;
    data['earn_point'] = this.earnPoint;
    data['description'] = this.description;
    data['video_link'] = this.videoLink;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    data['link'] = this.link;
    return data;
  }
}
