import 'package:advanced_ecommerse/lib/featutres/product_destails/data/response/details_data_response.dart';
import 'package:advanced_ecommerse/lib/featutres/product_destails/presntation/model/details_data_model.dart';

class DetailsModel {
  List<DetailsDataModel> data;
  bool success;
  int status;

  DetailsModel({
   required this.data,
   required this.success,
   required this.status});


}





