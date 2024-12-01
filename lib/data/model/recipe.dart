import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  bool success;
  String data;
  dynamic error;

  Recipe(this.success, this.data, this.error);

  factory Recipe.fromJson(dynamic json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}

@JsonSerializable()
class Data {
  bool hasMore;
  List<Items> items;
  num total;
  num pageNumber;
  num pageSize;

  Data(this.hasMore, this.items, this.total, this.pageNumber, this.pageSize);

  factory Data.fromJson(dynamic json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Items {
  num id;
  String creatorLink;
  String creatorImage;
  String createdAt;
  String updatedAt;
  bool isFeatured;
  String name;
  dynamic description;
  String image;
  String creatorName;
  AdditionalInfo additionalInfo;

  Items(
      this.id,
      this.creatorLink,
      this.creatorImage,
      this.createdAt,
      this.updatedAt,
      this.isFeatured,
      this.name,
      this.description,
      this.image,
      this.creatorName,
      this.additionalInfo);

  factory Items.fromJson(dynamic json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class AdditionalInfo {
  num id;
  dynamic time;
  dynamic videoLink;

  AdditionalInfo(this.id, this.time, this.videoLink);

  factory AdditionalInfo.fromJson(dynamic json) =>
      _$AdditionalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalInfoToJson(this);
}
