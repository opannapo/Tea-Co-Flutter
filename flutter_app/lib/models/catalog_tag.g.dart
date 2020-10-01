// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Catalog_tag _$Catalog_tagFromJson(Map<String, dynamic> json) {
  return Catalog_tag()
    ..id = json['id'] as num
    ..tag_name = json['tag_name'] as String;
}

Map<String, dynamic> _$Catalog_tagToJson(Catalog_tag instance) =>
    <String, dynamic>{'id': instance.id, 'tag_name': instance.tag_name};
