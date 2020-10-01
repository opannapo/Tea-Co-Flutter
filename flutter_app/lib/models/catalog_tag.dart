import 'package:json_annotation/json_annotation.dart';

part 'catalog_tag.g.dart';

@JsonSerializable()
class Catalog_tag {
    Catalog_tag();

    num id;
    String tag_name;
    
    factory Catalog_tag.fromJson(Map<String,dynamic> json) => _$Catalog_tagFromJson(json);
    Map<String, dynamic> toJson() => _$Catalog_tagToJson(this);
}
