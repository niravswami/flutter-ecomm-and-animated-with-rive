part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;

  // Register SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerSingleton<SharedPreferences>(sharedPreferences);

  serviceLocator.registerLazySingleton(
    () => Hive.box(name: 'ecom'),
  );

  // App user cubit
  serviceLocator.registerLazySingleton(() => AppUserCubit());

  _registerHttpService();
  _initAuth();
  _initProducts();
}

void _registerHttpService() {
  final httpClientInstance = HttpClientInstance();
  serviceLocator
      .registerLazySingleton<HttpClientInstance>(() => httpClientInstance);
}

void _initAuth() {
  // data sources
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        httpClientInstance: serviceLocator(),
      ),
    )
    // repositories
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        authRemoteDataSource: serviceLocator(),
        sharedPreferences: serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserLoginUsecase(
        authRepository: serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        userLoginUsecase: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}

void _initProducts() {
  // data sources
  serviceLocator
    ..registerFactory<ProductRemoteDataSources>(
      () => ProductRemoteDataSourcesImpl(
        // client: serviceLocator(),
        serviceLocator(),
      ),
    )
    // repositories
    ..registerFactory<ProductRepository>(
      () => ProductRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => GetProductsUsecase(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => ProductBloc(
        getProductsUsecase: serviceLocator(),
      ),
    );
}
