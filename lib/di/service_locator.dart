import 'package:applycamp/core/common/dio_consumer.dart';
import 'package:applycamp/core/common/dio_instances.dart';
import 'package:applycamp/data/local/app_preferences.dart';
import 'package:applycamp/data/repository/agent_auth_repository_impl.dart';
import 'package:applycamp/data/repository/application_repository_impl.dart';
import 'package:applycamp/data/repository/school_repository_impl.dart';
import 'package:applycamp/data/repository/student_auth_repository_impl.dart';
import 'package:applycamp/data/repository/search_repository_impl.dart';
import 'package:applycamp/data/repository/student_repository_impl.dart';
import 'package:applycamp/data/repository/sub_user_repository_impl.dart';
import 'package:applycamp/data/repository/user_repository_impl.dart';
import 'package:applycamp/data/source/agent_auth_data_source.dart';
import 'package:applycamp/data/source/application_data_source.dart';
import 'package:applycamp/data/source/school_data_source.dart';
import 'package:applycamp/data/source/student_auth_data_source.dart';
import 'package:applycamp/data/source/search_data_source.dart';
import 'package:applycamp/data/source/student_data_source.dart';
import 'package:applycamp/data/source/sub_user_data_source.dart';
import 'package:applycamp/data/source/user_data_source.dart';
import 'package:applycamp/domain/entity/auth_data.dart';
import 'package:applycamp/domain/repository/agent_auth_repository.dart';
import 'package:applycamp/domain/repository/application_repository.dart';
import 'package:applycamp/domain/repository/school_repository.dart';
import 'package:applycamp/domain/repository/student_auth_repository.dart';
import 'package:applycamp/domain/repository/search_repository.dart';
import 'package:applycamp/domain/repository/student_repository.dart';
import 'package:applycamp/domain/repository/sub_user_repository.dart';
import 'package:applycamp/domain/repository/user_repository.dart';
import 'package:applycamp/ui/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

// an instance for all parts that need auth check
ValueNotifier<AuthData> loggedInUserNotifier = ValueNotifier(AuthData());
ValueNotifier<List<AuthData>> AllloggedInUsersNotifier = ValueNotifier([]);

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
  instance.registerLazySingleton<SubUserRepository>(
      () => SubUserRepositoryImpl(instance()));
  instance.registerLazySingleton<StudentRepository>(
      () => StudentRepositoryImpl(instance()));
  instance.registerLazySingleton<ApplicationRepository>(
      () => ApplicationRepositoryImpl(instance()));
  instance.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(instance()));
  instance.registerLazySingleton<SchoolRepository>(
      () => SchoolRepositoryImpl(instance()));

  // data sources
  instance.registerLazySingleton<StudentAuthDataSource>(
      () => StudentAuthDataSourceImpl(instance()));
  instance.registerLazySingleton<AgentAuthDataSource>(
      () => AgentAuthDataSourceImpl(instance()));
  instance.registerLazySingleton<SearchDataSource>(
      () => SearchDataSourceImpl(instance()));
  instance.registerLazySingleton<SubUserDataSource>(
      () => SubUserDataSourceImpl(instance()));
  instance.registerLazySingleton<StudentDataSource>(
      () => StudentDataSourceImpl(instance()));
  instance.registerLazySingleton<ApplicationDataSource>(
      () => ApplicationDataSourceImpl(instance()));
  instance.registerLazySingleton<UserDataSource>(
      () => UserDataSourceImpl(instance()));
  instance.registerLazySingleton<SchoolDataSource>(
      () => SchoolDataSourceImpl(instance()));

  // blocs
  instance.registerLazySingleton<AuthBloc>(() => AuthBloc(instance()));
}
