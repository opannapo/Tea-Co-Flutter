import 'package:json_annotation/json_annotation.dart';

part 'catalog_product_variant.g.dart';

@JsonSerializable()
class Catalog_product_variant {
    Catalog_product_variant();

    String discount_price;
    num id;
    bool is_discount;
    num item_order;
    String price;
    String variant_name;
    
    factory Catalog_product_variant.fromJson(Map<String,dynamic> json) => _$Catalog_product_variantFromJson(json);
    Map<String, dynamic> toJson() => _$Catalog_product_variantToJson(this);
}
