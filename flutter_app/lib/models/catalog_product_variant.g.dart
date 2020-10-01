// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_product_variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Catalog_product_variant _$Catalog_product_variantFromJson(
    Map<String, dynamic> json) {
  return Catalog_product_variant()
    ..discount_price = json['discount_price'] as String
    ..id = json['id'] as num
    ..is_discount = json['is_discount'] as bool
    ..item_order = json['item_order'] as num
    ..price = json['price'] as String
    ..variant_name = json['variant_name'] as String;
}

Map<String, dynamic> _$Catalog_product_variantToJson(
        Catalog_product_variant instance) =>
    <String, dynamic>{
      'discount_price': instance.discount_price,
      'id': instance.id,
      'is_discount': instance.is_discount,
      'item_order': instance.item_order,
      'price': instance.price,
      'variant_name': instance.variant_name
    };
