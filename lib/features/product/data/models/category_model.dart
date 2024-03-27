import 'package:ecomm_bloc_app/features/product/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.image,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };

  factory CategoryModel.fromJson(Map<String, dynamic> map) => CategoryModel(
        id: map["id"],
        name: map["name"],
        image: map["image"],
      );

  CategoryModel copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }
}
