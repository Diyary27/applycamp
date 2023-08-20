import 'package:applycamp/core/constant/remote_constant.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initModule() async {
  // Dio instance
  final dio = Dio(
    BaseOptions(
      baseUrl: RemoteConstant.baseUrl,
    ),
  );
  instance.registerLazySingleton<Dio>(() => dio);

  // SharedPreferences Instance
  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Repositories
}
