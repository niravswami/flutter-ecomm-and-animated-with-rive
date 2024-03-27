import 'dart:convert';

import 'package:ecomm_bloc_app/core/error/exceptions.dart';
import 'package:ecomm_bloc_app/core/httpClientInstans/http_client_instans.dart';
import 'package:ecomm_bloc_app/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<UserModel> getAuthUserProfile();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final HttpClientInstance httpClientInstance;

  AuthRemoteDataSourceImpl({required this.httpClientInstance});

  @override
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await httpClientInstance.postReq('/auth/login', {
        'email': email,
        'password': password,
      });
      print('loginWithEmailPassword');
      final data = jsonDecode(response.body);
      print(data);
      print(data['access_token']);
      if (data['access_token'] == null) {
        throw const ServerException("User not found!");
      }
      return data['access_token'];
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> getAuthUserProfile() async {
    try {
      final response = await httpClientInstance.getReq('/auth/profile');
      final data = jsonDecode(response.body);
      if (data == null) {
        throw const ServerException("User not found!");
      }
      print('getAuthUserProfile');
      print(data);
      final user = UserModel.fromJson(data);
      return user;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
