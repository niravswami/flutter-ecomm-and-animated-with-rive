import 'package:ecomm_bloc_app/core/common/entities/user_entity.dart';
import 'package:ecomm_bloc_app/core/constants/local_storage_keys_constants.dart';
import 'package:ecomm_bloc_app/core/error/exceptions.dart';
import 'package:ecomm_bloc_app/core/error/failures.dart';
import 'package:ecomm_bloc_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:ecomm_bloc_app/features/auth/domian/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final SharedPreferences sharedPreferences;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.sharedPreferences,
  });

  @override
  Future<Either<Failure, UserEntity>> userLoginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final accessToken = await authRemoteDataSource.loginWithEmailPassword(
          email: email, password: password);
      print('accessToken');
      print(accessToken);
      await sharedPreferences.setString(
          LocalStoragekeysConstants.accessToken, accessToken);

      final user = await authRemoteDataSource.getAuthUserProfile();

      print(user);

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
