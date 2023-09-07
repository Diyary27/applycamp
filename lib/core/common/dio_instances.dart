import 'package:applycamp/core/constant/remote_constant.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:dio/dio.dart';

// configure the http client and add the accesstoken and other headers if exist
final portalHttpClient =
    Dio(BaseOptions(baseUrl: PortalRemoteConstants.baseUrl))
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          final accessToken = accessTokenNotifier.value;
          if (accessToken != null || accessToken != '') {
            options.headers['Authorization'] = accessToken;
          }
          handler.next(options);
        },
      ));

enum DioInstances {
  portal,
  blog,
}
