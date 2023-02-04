// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['id'] as int,
      json['name'] as String,
      json['slug'] as String?,
      json['description'] as String,
      (json['weight'] as num?)?.toDouble(),
      (json['rating'] as num?)?.toDouble(),
      json['how_to_use'] as String?,
      json['number_of_reviews'] as int,
      json['is_on_sale'] as bool,
      json['store_price'] as String,
      json['sale_price'] as String,
      json['image1'] as String?,
      json['image2'] as String?,
      json['image3'] as String?,
      json['image4'] as String?,
      Category.fromJson(json['category'] as Map<String, dynamic>),
      json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'weight': instance.weight,
      'rating': instance.rating,
      'how_to_use': instance.how_to_use,
      'number_of_reviews': instance.number_of_reviews,
      'is_on_sale': instance.is_on_sale,
      'store_price': instance.store_price,
      'sale_price': instance.sale_price,
      'image1': instance.image1,
      'image2': instance.image2,
      'image3': instance.image3,
      'image4': instance.image4,
      'category': instance.category,
      'brand': instance.brand,
    };
