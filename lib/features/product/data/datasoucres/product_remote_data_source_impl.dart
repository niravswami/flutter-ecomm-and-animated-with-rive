part of 'product_remote_data_source.dart';

class ProductRemoteDataSourcesImpl implements ProductRemoteDataSources {
  final HttpClientInstance httpClientInstance;
  ProductRemoteDataSourcesImpl(this.httpClientInstance);

  @override
  Future<ProductModel> getProductDetails(int id) async {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await httpClientInstance.getReq('/products');
      final resBody = jsonDecode(response.body);
      final List<ProductModel> products = (resBody as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();
      return products;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ProductModel>> searchProducts(String query) {
    // TODO: implement searchProducts
    throw UnimplementedError();
  }
}
