import 'package:json_annotation/json_annotation.dart';
part 'brand.g.dart';

@JsonSerializable()
class Brand {
  String? name;
  String? image;
  Brand(
    this.name,
    this.image,
  );
  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}
