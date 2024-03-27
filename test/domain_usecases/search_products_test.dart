// import 'package:ecomm_bloc_app/features/product/data/models/category_model.dart';
// import 'package:ecomm_bloc_app/features/product/domain/entities/product_entity.dart';
// import 'package:ecomm_bloc_app/features/product/domain/repositories/product_repository.dart';
// import 'package:ecomm_bloc_app/features/product/domain/usecases/search_products_usecase.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'get_products_test.mocks.dart';

// // @GenerateNiceMocks([MockSpec<ProductRepository>()])
// void main() {
//   late SearchProductsUsecase usecase;
//   late MockProductRepository mockProductRepository;

//   const String query = 'title=Generic';

//   final tProductList = [
//     ProductEntity(
//         id: 1,
//         title: 'title',
//         price: 1,
//         description: 'description',
//         category: CategoryModel(id: 1, name: 'name', image: 'cateImg'),
//         images: ['img1', 'img2']),
//     ProductEntity(
//         id: 2,
//         title: 'title2',
//         price: 12,
//         description: 'description2',
//         category: CategoryModel(id: 1, name: 'name', image: 'cateImg'),
//         images: ['img1', 'img2'])
//   ];

//   setUp(() {
//     mockProductRepository = MockProductRepository();
//     usecase = SearchProductsUsecase(mockProductRepository);
//   });

//   test("should search products", () async {
//     // arrenge
//     when(mockProductRepository.searchProducts(query))
//         .thenAnswer((_) async => tProductList);

//     // act
//     final result = await mockProductRepository.searchProducts(query);

//     // assert
//     expect(result, tProductList);
//     verify(mockProductRepository.searchProducts(query));
//     verifyNoMoreInteractions(mockProductRepository);
//   });
// }
