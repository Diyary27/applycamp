import 'dart:io';

import 'package:applycamp/core/common/dio_consumer.dart';
import 'package:applycamp/core/constant/remote_constant.dart';
import 'package:applycamp/data/model/file_element.dart';
import 'package:dio/dio.dart';

abstract class UserDataSource {
  Future getDashboard();
  Future uploadProfilePhoto(File photo);
}

class UserDataSourceImpl implements UserDataSource {
  final PortalDioConsumer dioConsumer;

  UserDataSourceImpl(this.dioConsumer);

  @override
  Future getDashboard() async {
    final response = await dioConsumer.get(PortalRemoteConstants.dashboard);
  }

  @override
  Future uploadProfilePhoto(File photo) async {
    final response = await dioConsumer.post(
      PortalRemoteConstants.uploadProfileImage,
      body: FormData.fromMap(
        {
          "image": await MultipartFile.fromFile(photo.path),
        },
      ),
    );

    final FileElement imageResponse =
        FileElement.fromJson(response.data["image"]);

    return imageResponse;
  }
}
