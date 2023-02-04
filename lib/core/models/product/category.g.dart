// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      json['id'] as int,
      json['name'] as String,
      json['is_active'] as bool,
      json['slug'] as String,
      json['image'] as String,
      (json['sub_category'] as List<dynamic>)
          .map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_active': instance.is_active,
      'slug': instance.slug,
      'image': instance.image,
      'sub_category': instance.sub_category,
    };
