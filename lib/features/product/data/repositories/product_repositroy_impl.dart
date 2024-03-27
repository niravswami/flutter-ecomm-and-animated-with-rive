// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecomm_bloc_app/core/error/exceptions.dart';
import 'package:ecomm_bloc_app/core/error/failures.dart';
import 'package:ecomm_bloc_app/features/product/data/datasoucres/product_remote_data_source.dart';
import 'package:ecomm_bloc_app/features/product/data/models/product_model.dart';
import 'package:ecomm_bloc_app/features/product/domain/repositories/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRemoteDataSources productRemoteDataSources;
  ProductRepositoryImpl(
    this.productRemoteDataSources,
  );

  @override
  Future<Either<Failure, ProductModel>> getProductDetails(int id) {
    // TODO: implement getProductDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final products = await productRemoteDataSources.getProducts();
      return right(products);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> searchProducts(String query) {
    // TODO: implement searchProducts
    throw UnimplementedError();
  }
}
