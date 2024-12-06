class DetailsResponse {
  bool? success;
  Data? data;

  DetailsResponse({this.success, this.data,});

  DetailsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}

class Data {
  int? id;

  List<ListProduct>? listProducts;
  List<Step>? steps;

  Data(
      {this.id,

        this.listProducts,
        this.steps,
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    if (json['listProducts'] != null) {
      listProducts = <ListProduct>[];
      json['listProducts'].forEach((v) {
        listProducts!.add(new ListProduct.fromJson(v));
      });
    }
    if (json['steps'] != null) {
      steps = <Step>[];
      json['steps'].forEach((v) {
        steps!.add(new Step.fromJson(v));
      });
    }

  }

}



class ListProduct{
  int? quantity;
  bool? isFeatured;
  Product? product;

  ListProduct({this.quantity, this.isFeatured, this.product});

  ListProduct.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    isFeatured = json['isFeatured'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }


}

class Product {
  double? basePrice;

  String? status;
  //int? weight;

  String? photoType;
  String? imageUrl;
  String? thumbnailUrl;
  List<String>? photoUrls;
  List<String>? tags;
  String? unitValue;
  bool? deliveredByRabbit;
  Null? supplier;
  List<String>? puchaseModes;
  String? type;
  bool? favorite;
  String? skuNo;
  String? name;
  String? brand;
  String? description;
  String? shortDescription;
  String? unit;
  String? currency;
  double? price;
  bool? inStock;
  bool? availableInStore;


  Product(
      {
        this.basePrice,

        this.status,
     //   this.weight,

        this.photoType,
        this.imageUrl,
        this.thumbnailUrl,
        this.photoUrls,
        this.tags,
        this.unitValue,
        this.deliveredByRabbit,
        this.supplier,
        this.puchaseModes,
        this.type,
        this.favorite,
        this.skuNo,
        this.name,
        this.brand,
        this.description,
        this.shortDescription,
        this.unit,
        this.currency,
        this.price,
        this.inStock,
        this.availableInStore,
       });

  Product.fromJson(Map<String, dynamic> json) {
    basePrice = double.parse(json['basePrice'].toString());

    status = json['status'];
  //  weight = json['weight'];

    photoType = json['photoType'];
    imageUrl = json['imageUrl'];
    thumbnailUrl = json['thumbnailUrl'];
    photoUrls = json['photoUrls'].cast<String>();
    tags = json['tags'].cast<String>();
    unitValue = json['unitValue'];
    deliveredByRabbit = json['deliveredByRabbit'];
    supplier = json['supplier'];
    puchaseModes = json['puchaseModes'].cast<String>();
    type = json['type'];
    favorite = json['favorite'];
    skuNo = json['skuNo'];
    name = json['name'];
    brand = json['brand'];
    description = json['description'];
    shortDescription = json['shortDescription'];
    unit = json['unit'];
    currency = json['currency'];
    price = double.parse(json['price'].toString());
    inStock = json['inStock'];
    availableInStore = json['availableInStore'];
  }

}

class Step {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? stepNum;
  String? description;
  String? image;

  Step(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.stepNum,
        this.description,
        this.image});

  Step.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    stepNum = json['stepNum'];
    description = json['description'];
    image = json['image'];
  }


}

