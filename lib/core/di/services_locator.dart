import 'package:get_it/get_it.dart';
import 'package:quent/Features/auth/data/data_source/auth_data_source.dart';
import 'package:quent/Features/auth/data/repo/login_repo.dart';
import 'package:quent/Features/auth/data/repo/signup_repo.dart';
import 'package:quent/Features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:quent/Features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:quent/core/services/local/local_storage_helper.dart';
import 'package:quent/core/services/network/api_service.dart';
import 'package:quent/core/services/network/dio_client.dart';

final sl = GetIt.instance;

Future<void> setUpServicesLocator() async {
  await _initCore();
  await _initAuth();
}

Future<void> _initCore() async {
  await LocalStorageHelper().init();
  DioClient().init();
  sl.registerSingleton(ApiService());
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(() => LoginCubit(repo: sl()))
    ..registerFactory(() => SignupCubit(sl()))
    ..registerLazySingleton(() => LoginRepo(authDataSource: sl()))
    ..registerLazySingleton(() => AuthDataSource(apiService: sl()))
    ..registerLazySingleton(() => SignupRepo(authDataSource: sl()));
}
