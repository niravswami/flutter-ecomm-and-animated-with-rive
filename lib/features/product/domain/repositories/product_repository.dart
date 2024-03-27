import 'package:ecomm_bloc_app/core/error/failures.dart';
import 'package:ecomm_bloc_app/features/product/domain/entities/product_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> searchProducts(String query);
  Future<Either<Failure, ProductEntity>> getProductDetails(int id);
}
