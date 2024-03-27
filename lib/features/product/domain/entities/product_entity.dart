// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecomm_bloc_app/features/product/data/models/category_model.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final int price;
  final String description;
  final CategoryModel? category;
  final List<String>? images;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    this.category,
    this.images,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        category,
        images,
      ];
}
