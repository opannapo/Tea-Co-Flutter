import 'package:json_annotation/json_annotation.dart';
import "catalog_modifier_option.dart";
part 'catalog_modifier.g.dart';

@JsonSerializable()
class Catalog_modifier {
    Catalog_modifier();

    num default_modifier_option_id;
    String display_mode;
    num id;
    String modifier_name;
    bool multiple_select;
    List<Catalog_modifier_option> options;
    
    factory Catalog_modifier.fromJson(Map<String,dynamic> json) => _$Catalog_modifierFromJson(json);
    Map<String, dynamic> toJson() => _$Catalog_modifierToJson(this);
}
