// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecomm_bloc_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:ecomm_bloc_app/core/common/entities/user_entity.dart';
import 'package:ecomm_bloc_app/features/auth/domian/usecases/user_login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLoginUsecase _userLoginUsecase;
  final AppUserCubit _appUserCubit;
  AuthBloc({
    required UserLoginUsecase userLoginUsecase,
    required AppUserCubit appUserCubit,
  })  : _userLoginUsecase = userLoginUsecase,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthLogin>((event, emit) async {
      emit(AuthLoading());
      final res = await _userLoginUsecase(AuthLoginParams(
        email: event.email,
        password: event.password,
      ));

      res.fold((l) => emit(AuthFailure(l.message)), (user) {
        print(user);
        _appUserCubit.updateUser(user);
        emit(AuthSuccess(user));
      });
    });
  }
}
