import 'package:ecomm_bloc_app/core/common/entities/user_entity.dart';
import 'package:ecomm_bloc_app/core/error/failures.dart';
import 'package:ecomm_bloc_app/core/usecase/usecase.dart';
import 'package:ecomm_bloc_app/features/auth/domian/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLoginUsecase implements UseCase<UserEntity, AuthLoginParams> {
  final AuthRepository authRepository;

  UserLoginUsecase({required this.authRepository});

  @override
  Future<Either<Failure, UserEntity>> call(params) async {
    return await authRepository.userLoginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class AuthLoginParams {
  final String email;
  final String password;

  AuthLoginParams({required this.email, required this.password});
}
