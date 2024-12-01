// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      json['success'] as bool,
      json['data'] as String,
      json['error'],
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['hasMore'] as bool,
      (json['items'] as List<dynamic>).map(Items.fromJson).toList(),
      json['total'] as num,
      json['pageNumber'] as num,
      json['pageSize'] as num,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'hasMore': instance.hasMore,
      'items': instance.items,
      'total': instance.total,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      json['id'] as num,
      json['creatorLink'] as String,
      json['creatorImage'] as String,
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['isFeatured'] as bool,
      json['name'] as String,
      json['description'],
      json['image'] as String,
      json['creatorName'] as String,
      AdditionalInfo.fromJson(json['additionalInfo']),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'id': instance.id,
      'creatorLink': instance.creatorLink,
      'creatorImage': instance.creatorImage,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isFeatured': instance.isFeatured,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'creatorName': instance.creatorName,
      'additionalInfo': instance.additionalInfo,
    };

AdditionalInfo _$AdditionalInfoFromJson(Map<String, dynamic> json) =>
    AdditionalInfo(
      json['id'] as num,
      json['time'],
      json['videoLink'],
    );

Map<String, dynamic> _$AdditionalInfoToJson(AdditionalInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
      'videoLink': instance.videoLink,
    };
