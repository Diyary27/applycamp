import 'package:applycamp/core/common/api_consumer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class PortalDioConsumer implements ApiConsumer {
  final Dio httpClient;

  PortalDioConsumer(this.httpClient);

  @override
  Future delete(String path, {Map<String, dynamic>? queryParameters}) {
    throw UnimplementedError();
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
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    final response = await httpClient.post(path, data: body);
    return response;
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    final response = await httpClient.put(path, data: body);
    return response;
  }
}
