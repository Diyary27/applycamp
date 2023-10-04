import 'package:applycamp/core/constant/remote_constant.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/entity/auth_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// configure the http client and add the accesstoken and other headers if exist
final portalHttpClient =
    Dio(BaseOptions(baseUrl: PortalRemoteConstants.baseUrl))
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          final accessToken = loggedInUserNotifier.value.accessToken;
          if (accessToken != null || accessToken != '') {
            String authorization = 'Bearer ' + accessToken.toString();
            options.headers['Authorization'] = authorization;
          }
          handler.next(options);
        },
      ));

enum DioInstances {
  portal,
  blog,
}
