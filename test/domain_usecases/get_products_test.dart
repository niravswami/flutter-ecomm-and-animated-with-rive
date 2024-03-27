// import 'package:ecomm_bloc_app/core/usecase/usecase.dart';
// import 'package:ecomm_bloc_app/features/product/data/models/category_model.dart';
// import 'package:ecomm_bloc_app/features/product/domain/entities/product_entity.dart';
// import 'package:ecomm_bloc_app/features/product/domain/repositories/product_repository.dart';
// import 'package:ecomm_bloc_app/features/product/domain/usecases/get_product_usecase.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// // class MockProductRepository extends Mock implements ProductRepository {}
// import 'get_products_test.mocks.dart';

// // @GenerateNiceMocks([MockSpec<ProductRepository>()])
// void main() {
//   late GetProductsUsecase usecase;
//   late MockProductRepository mockProductRepository;

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
//     usecase = GetProductsUsecase(mockProductRepository);
//   });
//   test("should get products", () async {
//     // arrenge
//     when(mockProductRepository.getProducts())
//         .thenAnswer((_) async => tProductList);

//     // act
//     final result = await usecase(NoParams());

//     // assert
//     expect(result, tProductList);

//     verify(mockProductRepository.getProducts());
//     verifyNoMoreInteractions(mockProductRepository);
//   });
// }
