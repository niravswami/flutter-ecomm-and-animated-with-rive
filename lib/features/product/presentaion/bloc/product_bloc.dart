// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecomm_bloc_app/core/usecase/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecomm_bloc_app/features/product/domain/entities/product_entity.dart';
import 'package:ecomm_bloc_app/features/product/domain/usecases/get_product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUsecase _getProductsUsecase;
  ProductBloc({
    required GetProductsUsecase getProductsUsecase,
  })  : _getProductsUsecase = getProductsUsecase,
        super(ProductInitial()) {
    // ---- fetch all products
    on<ProductListFetch>(
      (event, emit) async {
        emit(ProductListLoading());
        final res = await _getProductsUsecase(NoParams());

        res.fold(
          (l) => emit(ProductListError(l.message)),
          (r) => emit(ProductListSuccess(r)),
        );
      },
    );
  }
}
