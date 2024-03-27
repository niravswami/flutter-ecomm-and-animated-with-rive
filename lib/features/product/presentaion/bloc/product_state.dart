part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductListLoading extends ProductState {}

final class ProductListSuccess extends ProductState {
  final List<ProductEntity> products;
  const ProductListSuccess(this.products);
}

final class ProductListError extends ProductState {
  final String error;
  const ProductListError(this.error);
}
