import 'package:ecomm_bloc_app/core/common/entities/user_entity.dart';
import 'package:ecomm_bloc_app/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserEntity>> userLoginWithEmailPassword({
    required String email,
    required String password,
  });
}
