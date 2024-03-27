// import 'package:ecomm_bloc_app/features/product/data/models/category_model.dart';
// import 'package:ecomm_bloc_app/features/product/domain/entities/product_entity.dart';
// import 'package:ecomm_bloc_app/features/product/domain/repositories/product_repository.dart';
// import 'package:ecomm_bloc_app/features/product/domain/usecases/get_product_details_usecase.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'get_products_test.mocks.dart';

// @GenerateNiceMocks([MockSpec<ProductRepository>()])
// void main() {
//   late GetProductDetailsUsecase usecase;
//   late MockProductRepository mockProductRepository;

//   const productId = 1;

//   final tProductDetails = ProductEntity(
//     id: productId,
//     title: 'title',
//     price: 1,
//     description: 'description',
//     category: CategoryModel(
//       id: 1,
//       name: 'name',
//       image: 'image',
//     ),
//     images: ['images'],
//   );

//   setUp(() {
//     mockProductRepository = MockProductRepository();
//     usecase = GetProductDetailsUsecase(mockProductRepository);
//   });

//   test("shouild get product details", () async {
//     // arrenge
//     when(mockProductRepository.getProductDetails(productId))
//         .thenAnswer((_) async => tProductDetails);

//     // act
//     final result = await usecase(GetProductDetailsParams(id: productId));

//     // assert
//     expect(result, tProductDetails);
//     verify(mockProductRepository.getProductDetails(productId));
//     verifyNoMoreInteractions(mockProductRepository);
//   });
// }
