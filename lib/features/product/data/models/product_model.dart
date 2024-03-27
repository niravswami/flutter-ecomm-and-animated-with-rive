import 'package:ecomm_bloc_app/features/product/data/models/category_model.dart';
import 'package:ecomm_bloc_app/features/product/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    super.category,
    super.images,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'images': images,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      description: map['description'],
      category: CategoryModel.fromJson(map['category']),
      images: List<String>.from(map['images']),
    );
  }

  ProductModel copyWith({
    int? id,
    String? title,
    int? price,
    String? description,
    CategoryModel? category,
    List<String>? images,
  }) =>
      ProductModel(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        category: category ?? this.category,
        images: images ?? this.images,
      );
}
