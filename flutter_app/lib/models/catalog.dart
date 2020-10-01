import 'package:json_annotation/json_annotation.dart';
import "catalog_modifier.dart";
import "catalog_product_variant.dart";
import "catalog_tag.dart";
part 'catalog.g.dart';

@JsonSerializable()
class Catalog {
    Catalog();

    num brand_id;
    String brand_name;
    String category_description_1;
    num category_id;
    String category_name;
    num category_order;
    num default_product_variant_id;
    String description_1;
    String description_2;
    num id;
    bool is_bundle;
    List<Catalog_modifier> modifiers;
    String photo_1;
    String photo_1_url;
    String photo_2;
    String photo_2_url;
    String photo_3;
    String photo_3_url;
    String photo_4;
    String photo_4_url;
    String product_name;
    String product_no;
    num product_order;
    List<Catalog_product_variant> product_variants;
    num stock_quantity;
    List<Catalog_tag> tags;
    String uuid;
    
    factory Catalog.fromJson(Map<String,dynamic> json) => _$CatalogFromJson(json);
    Map<String, dynamic> toJson() => _$CatalogToJson(this);
}
