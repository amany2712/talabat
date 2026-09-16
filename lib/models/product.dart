import 'package:talabat/models/dimensions.dart';
import 'package:talabat/models/meta.dart';
import 'package:talabat/models/reviews.dart';

class Product {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Reviews>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    title = json['title'];

    description = json['description'];

    category = json['category'];

    price = (json['price'] as num?)?.toDouble();

    discountPercentage =
        (json['discountPercentage'] as num?)?.toDouble();

    rating = (json['rating'] as num?)?.toDouble();

    stock = json['stock'];

    tags = json['tags'] != null
        ? List<String>.from(json['tags'])
        : [];

    brand = json['brand'];

    sku = json['sku'];

    weight = json['weight'];

    dimensions = json['dimensions'] != null
        ? Dimensions.fromJson(json['dimensions'])
        : null;

    warrantyInformation = json['warrantyInformation'];

    shippingInformation = json['shippingInformation'];

    availabilityStatus = json['availabilityStatus'];

    if (json['reviews'] != null) {
      reviews = <Reviews>[];

      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }

    returnPolicy = json['returnPolicy'];

    minimumOrderQuantity = json['minimumOrderQuantity'];

    meta = json['meta'] != null
        ? Meta.fromJson(json['meta'])
        : null;

    images = json['images'] != null
        ? List<String>.from(json['images'])
        : [];

    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['category'] = category;
    data['price'] = price;
    data['discountPercentage'] = discountPercentage;
    data['rating'] = rating;
    data['stock'] = stock;
    data['tags'] = tags;
    data['brand'] = brand;
    data['sku'] = sku;
    data['weight'] = weight;

    if (dimensions != null) {
      data['dimensions'] = dimensions!.toJson();
    }

    data['warrantyInformation'] = warrantyInformation;
    data['shippingInformation'] = shippingInformation;
    data['availabilityStatus'] = availabilityStatus;

    if (reviews != null) {
      data['reviews'] =
          reviews!.map((v) => v.toJson()).toList();
    }

    data['returnPolicy'] = returnPolicy;
    data['minimumOrderQuantity'] = minimumOrderQuantity;

    if (meta != null) {
      data['meta'] = meta!.toJson();
    }

    data['images'] = images;
    data['thumbnail'] = thumbnail;

    return data;
  }
}