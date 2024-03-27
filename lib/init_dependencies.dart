import 'package:ecomm_bloc_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:ecomm_bloc_app/core/httpClientInstans/http_client_instans.dart';
import 'package:ecomm_bloc_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:ecomm_bloc_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ecomm_bloc_app/features/auth/domian/repositories/auth_repository.dart';
import 'package:ecomm_bloc_app/features/auth/domian/usecases/user_login_usecase.dart';
import 'package:ecomm_bloc_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecomm_bloc_app/features/product/data/datasoucres/product_remote_data_source.dart';
import 'package:ecomm_bloc_app/features/product/data/repositories/product_repositroy_impl.dart';
import 'package:ecomm_bloc_app/features/product/domain/repositories/product_repository.dart';
import 'package:ecomm_bloc_app/features/product/domain/usecases/get_product_usecase.dart';
import 'package:ecomm_bloc_app/features/product/presentaion/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'init_dependencies_container.dart';
