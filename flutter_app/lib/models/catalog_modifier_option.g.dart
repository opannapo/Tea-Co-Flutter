// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_modifier_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Catalog_modifier_option _$Catalog_modifier_optionFromJson(
    Map<String, dynamic> json) {
  return Catalog_modifier_option()
    ..discount_price = json['discount_price'] as String
    ..id = json['id'] as num
    ..is_discount = json['is_discount'] as bool
    ..item_order = json['item_order'] as num
    ..option_name = json['option_name'] as String
    ..photo = json['photo'] as String
    ..photo_url = json['photo_url'] as String
    ..price = json['price'] as String;
}

Map<String, dynamic> _$Catalog_modifier_optionToJson(
        Catalog_modifier_option instance) =>
    <String, dynamic>{
      'discount_price': instance.discount_price,
      'id': instance.id,
      'is_discount': instance.is_discount,
      'item_order': instance.item_order,
      'option_name': instance.option_name,
      'photo': instance.photo,
      'photo_url': instance.photo_url,
      'price': instance.price
    };
