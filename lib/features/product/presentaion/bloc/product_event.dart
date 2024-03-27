part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class ProductListFetch extends ProductEvent {}

final class ProductSearch extends ProductEvent {
  final String query;
  const ProductSearch(this.query);
}
