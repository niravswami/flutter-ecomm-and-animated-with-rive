import 'package:ecomm_bloc_app/core/error/failures.dart';
import 'package:ecomm_bloc_app/core/usecase/usecase.dart';
import 'package:ecomm_bloc_app/features/product/domain/entities/product_entity.dart';
import 'package:ecomm_bloc_app/features/product/domain/repositories/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetProductDetailsUsecase
    implements UseCase<ProductEntity, GetProductDetailsParams> {
  final ProductRepository productRepository;
  GetProductDetailsUsecase(this.productRepository);

  @override
  Future<Either<Failure, ProductEntity>> call(
      GetProductDetailsParams params) async {
    return await productRepository.getProductDetails(params.id);
  }
}

class GetProductDetailsParams {
  final int id;

  GetProductDetailsParams({required this.id});
}
