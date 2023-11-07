import 'package:applycamp/core/common/api_consumer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class PortalDioConsumer implements ApiConsumer {
  final Dio httpClient;

  PortalDioConsumer(this.httpClient);

  @override
  Future delete(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await httpClient.delete(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await httpClient.get(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future post(String path,
      {Object? body, Map<String, dynamic>? queryParameters}) async {
    final response = await httpClient.post(
      path,
      data: body,
      options: Options(
        contentType: "multipart/form-data",
        headers: {},
      ),
    );
    return response;
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    final response = await httpClient.put(
      path,
      data: body,
      options: Options(headers: {"Content-Type": "application/json"}),
    );
    return response;
  }
}
