// ignore_for_file: non_constant_identifier_names

import 'package:beautify/core/models/product/brand.dart';
import 'package:beautify/core/models/product/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int id;
  String name;
  String? slug;
  String description;
  double? weight;
  String? rating;
  String? how_to_use;
  int number_of_reviews;
  bool is_on_sale;
  String store_price;
  String sale_price;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  Category category;
  Brand? brand;
  Product(
    this.id,
    this.name,
    this.slug,
    this.description,
    this.weight,
    this.rating,
    this.how_to_use,
    this.number_of_reviews,
    this.is_on_sale,
    this.store_price,
    this.sale_price,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.category,
    this.brand,
  );
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
