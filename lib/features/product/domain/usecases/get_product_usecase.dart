// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecomm_bloc_app/core/error/failures.dart';
import 'package:ecomm_bloc_app/core/usecase/usecase.dart';
import 'package:ecomm_bloc_app/features/product/domain/entities/product_entity.dart';
import 'package:ecomm_bloc_app/features/product/domain/repositories/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetProductsUsecase implements UseCase<List<ProductEntity>, NoParams> {
  final ProductRepository productRepository;

  GetProductsUsecase(this.productRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(params) async {
    return await productRepository.getProducts();
  }
}
