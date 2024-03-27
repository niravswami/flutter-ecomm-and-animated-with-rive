// import 'package:ecomm_bloc_app/core/error/exceptions.dart';
// import 'package:ecomm_bloc_app/core/httpClientInstans/http_client_instans.dart';
// import 'package:ecomm_bloc_app/features/product/data/datasoucres/product_remote_data_source.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:http/http.dart' as http;
// import 'package:mockito/mockito.dart';

// import 'product_remote_datasource.mocks.dart';

// @GenerateNiceMocks([MockSpec<http.Client>()])
// void main() {
//   late ProductRemoteDataSources dataSource;
//   late MockClient mockHttpClient;
//   final httpClientInstance = HttpClientInstance();

//   setUp(() {
//     mockHttpClient = MockClient();
//     dataSource = ProductRemoteDataSourcesImpl(httpClientInstance);
//   });

//   test('should generate GET request to get products', () async {
//     // arrenge
//     when(mockHttpClient.get(any))
//         .thenAnswer((_) async => http.Response("api res", 200));

//     // act
//     await dataSource.getProducts();

//     // assert
//     verify(mockHttpClient.get(Uri.parse("our api")));
//   });

//   test('should throw server exception and response code is 404', () async {
//     // arrenge
//     when(mockHttpClient.get(any))
//         .thenAnswer((_) async => http.Response("api res", 404));

//     // act
//     final call = dataSource.getProducts;

//     // assert
//     expect(() => call(), throwsA(isA<ServerException>));
//   });
// }
