// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_modifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Catalog_modifier _$Catalog_modifierFromJson(Map<String, dynamic> json) {
  return Catalog_modifier()
    ..default_modifier_option_id = json['default_modifier_option_id'] as num
    ..display_mode = json['display_mode'] as String
    ..id = json['id'] as num
    ..modifier_name = json['modifier_name'] as String
    ..multiple_select = json['multiple_select'] as bool
    ..options = (json['options'] as List)
        ?.map((e) => e == null
            ? null
            : Catalog_modifier_option.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Catalog_modifierToJson(Catalog_modifier instance) =>
    <String, dynamic>{
      'default_modifier_option_id': instance.default_modifier_option_id,
      'display_mode': instance.display_mode,
      'id': instance.id,
      'modifier_name': instance.modifier_name,
      'multiple_select': instance.multiple_select,
      'options': instance.options
    };
