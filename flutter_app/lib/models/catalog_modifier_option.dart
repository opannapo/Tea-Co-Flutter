import 'package:json_annotation/json_annotation.dart';

part 'catalog_modifier_option.g.dart';

@JsonSerializable()
class Catalog_modifier_option {
    Catalog_modifier_option();

    String discount_price;
    num id;
    bool is_discount;
    num item_order;
    String option_name;
    String photo;
    String photo_url;
    String price;
    
    factory Catalog_modifier_option.fromJson(Map<String,dynamic> json) => _$Catalog_modifier_optionFromJson(json);
    Map<String, dynamic> toJson() => _$Catalog_modifier_optionToJson(this);
}
