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
  Future editProfile(String name, String organization, String phone,
      String? password, Map? profileImage);
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
  Future editProfile(String name, String organization, String phone,
      String? password, Map? profileImage) async {
    final response = await dioConsumer.put(
      PortalRemoteConstants.editProfile,
      body: {
        "password": password,
        "name": name,
        "phone": phone,
        "organization": organization,
        "profileImage": {
          "id": 3399,
          "uuid": "e582cd5f-c129-4b20-9335-ce355d2617dc"
        }
      },
    );
    final bool updated = response.data['updated'];

    return updated;
  }

  @override
  Future getProfile() async {
    final response = await dioConsumer.get(PortalRemoteConstants.userProfile);

    final userProfile = User.fromJson(response.data['user']);

    return userProfile;
  }
}
