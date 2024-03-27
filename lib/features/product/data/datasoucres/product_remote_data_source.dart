import 'dart:convert';

import 'package:ecomm_bloc_app/core/error/exceptions.dart';
import 'package:ecomm_bloc_app/core/httpClientInstans/http_client_instans.dart';
import 'package:ecomm_bloc_app/features/product/data/models/product_model.dart';

part 'product_remote_data_source_impl.dart';

abstract interface class ProductRemoteDataSources {
  Future<List<ProductModel>> getProducts();
  Future<List<ProductModel>> searchProducts(String query);
  Future<ProductModel> getProductDetails(int id);
}
