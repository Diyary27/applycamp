import 'package:applycamp/core/common/dio_consumer.dart';
import 'package:applycamp/core/constant/remote_constant.dart';
import 'package:applycamp/data/model/user_model/user.dart';
import 'package:applycamp/data/model/user_model/user_auth_response.dart';

abstract class AgentAuthDataSource {
  Future register(
      {required String email,
      required String password,
      required String name,
      required String organization,
      required String phone});
  Future login(String email, String password);
  Future sendForgotPassEmail(String email);
  Future getProfile();
  Future editProfile();
}

class AgentAuthDataSourceImpl implements AgentAuthDataSource {
  final PortalDioConsumer dioConsumer;

  AgentAuthDataSourceImpl(this.dioConsumer);

  @override
  Future login(String email, String password) async {
    final response = await dioConsumer.post(PortalRemoteConstants.agentLogin,
        body: {"email": email, "password": password});

    final authResponse = UserAuthResponse.fromJson(response.data);

    return authResponse;
  }

  @override
  Future register(
      {required String email,
      required String password,
      required String name,
      required String organization,
      required String phone}) async {
    final response = await dioConsumer
        .post(PortalRemoteConstants.agentRegisteration, queryParameters: {
      "name": name,
      "email": email,
      "password": password,
      "organization": organization,
      "phone": phone,
    });

    final authResponse = UserAuthResponse.fromJson(response.data);
    return authResponse;
  }

  @override
  Future sendForgotPassEmail(String email) {
    // TODO: implement sendForgotPassEmail
    throw UnimplementedError();
  }

  @override
  Future editProfile() {
    // TODO: implement editProfile
    throw UnimplementedError();
  }

  @override
  Future getProfile() async {
    final response = await dioConsumer.get(PortalRemoteConstants.userProfile);

    final userProfile = User.fromJson(response.data);

    return userProfile;
  }
}
