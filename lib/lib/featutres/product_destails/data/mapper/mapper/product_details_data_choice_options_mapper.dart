import 'package:advanced_ecommerse/lib/core/extensions/extensions.dart';
import 'package:advanced_ecommerse/lib/featutres/product_destails/data/response/details_choice_options.dart';
import 'package:advanced_ecommerse/lib/featutres/product_destails/presntation/model/details_choice_options_model.dart';

extension ProductDetailsDataChoiceOptionsMapper
    on DetailsChoiceOptions {
  DetailsChoiceOptionsModel toDomain() {
    return DetailsChoiceOptionsModel(
      name: name.onNull(),
      options: options.onNull(),
      title: title.onNull(),
    );
  }
}
