
import 'package:applycamp/core/common/dio_consumer.dart';
import 'package:applycamp/core/constant/remote_constant.dart';
import 'package:applycamp/data/model/student_model/student_auth_response.dart';

abstract class StudentAuthDataSource {
  Future<StudentAuthResponse> register(String fullName, String email,
      String password, String gender, String phone);
  Future<StudentAuthResponse> login(String email, String password);
  Future sendForgotPassEmail(String email);
}

class StudentAuthDataSourceImpl implements StudentAuthDataSource {
  final PortalDioConsumer dioConsumer;

  StudentAuthDataSourceImpl(this.dioConsumer);

  @override
  Future<StudentAuthResponse> login(String email, String password) async {
    final response = await dioConsumer.post(PortalRemoteConstants.studentLogin,
        body: {"email": email, "password": password});

    final authResponse = StudentAuthResponse.fromJson(response.data);

    return authResponse;
  }

  @override
  Future<StudentAuthResponse> register(String fullName, String email,
      String password, String gender, String phone) async {
    final response = await dioConsumer
        .post(PortalRemoteConstants.minimalRegisteration, queryParameters: {
      "fullName": fullName,
      "email": email,
      "password": password,
      "gender": gender,
      "phone": phone,
    });

    final authResponse = StudentAuthResponse.fromJson(response.data);
    return authResponse;
  }

  @override
  Future sendForgotPassEmail(String email) async {
    final response = await dioConsumer.post(
        PortalRemoteConstants.sendForgotPasswordEmail,
        body: {"email": email});
    final result = response.data["message"];
    return result;
  }
}
