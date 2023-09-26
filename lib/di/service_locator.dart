import 'package:applycamp/core/common/dio_consumer.dart';
import 'package:applycamp/core/common/dio_instances.dart';
import 'package:applycamp/data/local/app_preferences.dart';
import 'package:applycamp/data/repository/agent_auth_repository_impl.dart';
import 'package:applycamp/data/repository/student_auth_repository_impl.dart';
import 'package:applycamp/data/repository/search_repository_impl.dart';
import 'package:applycamp/data/source/agent_auth_data_source.dart';
import 'package:applycamp/data/source/student_auth_data_source.dart';
import 'package:applycamp/data/source/search_data_source.dart';
import 'package:applycamp/domain/repository/agent_auth_repository.dart';
import 'package:applycamp/domain/repository/student_auth_repository.dart';
import 'package:applycamp/domain/repository/search_repository.dart';
import 'package:applycamp/ui/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

// an instance for all parts that need auth check
ValueNotifier accessTokenNotifier = ValueNotifier(null);
ValueNotifier userFullNameNotifier = ValueNotifier(null);

Future<void> initServices() async {
  // dio instances
  instance.registerLazySingleton(() => portalHttpClient,
      instanceName: DioInstances.portal.name);

  // shared preferences
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  //
  instance.registerLazySingleton(() => sharedPreferences);

  // shared preferences implementation
  instance.registerLazySingleton(() => AppPreferences(instance()));

  //dio consumers
  instance.registerLazySingleton(() =>
      PortalDioConsumer(instance(instanceName: DioInstances.portal.name)));

  // repositories
  instance.registerLazySingleton<StudentAuthRepository>(
      () => StudentAuthRepositoryImpl(instance(), instance()));
  instance.registerLazySingleton<AgentAuthRepository>(
      () => AgentAuthRepositoryImpl(instance(), instance()));
  instance.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(instance()));

  // data sources
  instance.registerLazySingleton<StudentAuthDataSource>(
      () => StudentAuthDataSourceImpl(instance()));
  instance.registerLazySingleton<AgentAuthDataSource>(
      () => AgentAuthDataSourceImpl(instance()));
  instance.registerLazySingleton<SearchDataSource>(
      () => SearchDataSourceImpl(instance()));

  // blocs
  instance.registerLazySingleton<AuthBloc>(() => AuthBloc(instance()));
}
