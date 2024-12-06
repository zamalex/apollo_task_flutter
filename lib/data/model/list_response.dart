class ListResponse {
  bool? success;
  Data? data;
  String? error;

  ListResponse({this.success, this.data,this.error});

  ListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}

class Data {
  bool? hasMore;
  List<Recipe>? recipes;
  int? total;
  int? pageNumber;
  int? pageSize;

  Data({this.hasMore, this.recipes, this.total, this.pageNumber, this.pageSize});

  Data.fromJson(Map<String, dynamic> json) {
    hasMore = json['hasMore'];
    if (json['items'] != null) {
      recipes = <Recipe>[];
      json['items'].forEach((v) {
        recipes!.add( Recipe.fromJson(v));
      });
    }
    total = json['total'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
  }


}

class Recipe {
  int? id;
  String? creatorLink;
  String? creatorImage;
  String? createdAt;
  String? updatedAt;
  bool? isFeatured;
  String? name;
  String? description;
  String? image;
  String? creatorName;
  AdditionalInfo? additionalInfo;

  Recipe(
      {this.id,
        this.creatorLink,
        this.creatorImage,
        this.createdAt,
        this.updatedAt,
        this.isFeatured,
        this.name,
        this.description,
        this.image,
        this.creatorName,
        this.additionalInfo});

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creatorLink = json['creatorLink'];
    creatorImage = json['creatorImage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isFeatured = json['isFeatured'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    creatorName = json['creatorName'];
    additionalInfo = json['additionalInfo'] != null
        ? new AdditionalInfo.fromJson(json['additionalInfo'])
        : null;
  }


}

class AdditionalInfo {
  int? id;
  int? time;
  String? videoLink;

  AdditionalInfo({this.id, this.time, this.videoLink});

  AdditionalInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
    videoLink = json['videoLink'];
  }


}