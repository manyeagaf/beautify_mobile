// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      json['name'] as String,
      json['is_active'] as bool,
      json['slug'] as String,
      json['image'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'name': instance.name,
      'is_active': instance.is_active,
      'slug': instance.slug,
      'image': instance.image,
    };
