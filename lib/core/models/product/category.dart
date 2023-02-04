import 'package:beautify/core/models/product/sub_category.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
class Category {
  int id;
  String name;
  bool is_active;
  String slug;
  String image;
  List<SubCategory> sub_category;
  Category(
    this.id,
    this.name,
    this.is_active,
    this.slug,
    this.image,
    this.sub_category,
  );
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
