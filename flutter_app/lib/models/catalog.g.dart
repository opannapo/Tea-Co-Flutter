// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Catalog _$CatalogFromJson(Map<String, dynamic> json) {
  return Catalog()
    ..brand_id = json['brand_id'] as num
    ..brand_name = json['brand_name'] as String
    ..category_description_1 = json['category_description_1'] as String
    ..category_id = json['category_id'] as num
    ..category_name = json['category_name'] as String
    ..category_order = json['category_order'] as num
    ..default_product_variant_id = json['default_product_variant_id'] as num
    ..description_1 = json['description_1'] as String
    ..description_2 = json['description_2'] as String
    ..id = json['id'] as num
    ..is_bundle = json['is_bundle'] as bool
    ..modifiers = (json['modifiers'] as List)
        ?.map((e) => e == null
            ? null
            : Catalog_modifier.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..photo_1 = json['photo_1'] as String
    ..photo_1_url = json['photo_1_url'] as String
    ..photo_2 = json['photo_2'] as String
    ..photo_2_url = json['photo_2_url'] as String
    ..photo_3 = json['photo_3'] as String
    ..photo_3_url = json['photo_3_url'] as String
    ..photo_4 = json['photo_4'] as String
    ..photo_4_url = json['photo_4_url'] as String
    ..product_name = json['product_name'] as String
    ..product_no = json['product_no'] as String
    ..product_order = json['product_order'] as num
    ..product_variants = (json['product_variants'] as List)
        ?.map((e) => e == null
            ? null
            : Catalog_product_variant.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..stock_quantity = json['stock_quantity'] as num
    ..tags = (json['tags'] as List)
        ?.map((e) =>
            e == null ? null : Catalog_tag.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..uuid = json['uuid'] as String;
}

Map<String, dynamic> _$CatalogToJson(Catalog instance) => <String, dynamic>{
      'brand_id': instance.brand_id,
      'brand_name': instance.brand_name,
      'category_description_1': instance.category_description_1,
      'category_id': instance.category_id,
      'category_name': instance.category_name,
      'category_order': instance.category_order,
      'default_product_variant_id': instance.default_product_variant_id,
      'description_1': instance.description_1,
      'description_2': instance.description_2,
      'id': instance.id,
      'is_bundle': instance.is_bundle,
      'modifiers': instance.modifiers,
      'photo_1': instance.photo_1,
      'photo_1_url': instance.photo_1_url,
      'photo_2': instance.photo_2,
      'photo_2_url': instance.photo_2_url,
      'photo_3': instance.photo_3,
      'photo_3_url': instance.photo_3_url,
      'photo_4': instance.photo_4,
      'photo_4_url': instance.photo_4_url,
      'product_name': instance.product_name,
      'product_no': instance.product_no,
      'product_order': instance.product_order,
      'product_variants': instance.product_variants,
      'stock_quantity': instance.stock_quantity,
      'tags': instance.tags,
      'uuid': instance.uuid
    };
