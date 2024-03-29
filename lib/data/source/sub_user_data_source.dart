import 'package:applycamp/core/common/dio_consumer.dart';
import 'package:applycamp/core/constant/remote_constant.dart';
import 'package:applycamp/data/model/user_model/sub_user.dart';
import 'package:applycamp/domain/entity/sub_user.dart';

abstract class SubUserDataSource {
  Future getAllSubUsers();
  Future getSubUser();
  Future createSubUser(SubUserEntity subUserEntity);
  Future updateSubUser(SubUserEntity subUserEntity);
  Future deleteSubUser(int id);
}

class SubUserDataSourceImpl implements SubUserDataSource {
  final PortalDioConsumer dioConsumer;

  SubUserDataSourceImpl(this.dioConsumer);

  @override
  Future createSubUser(SubUserEntity subUserEntity) async {
    // {
    //   "name": subUserEntity.name,
    //   "password": subUserEntity.password,
    //   "email": subUserEntity.email,
    //   "canViewCommissions": subUserEntity.canViewCommissions,
    //   "organization": subUserEntity.organization,
    //   "phone": subUserEntity.phone,
    //   "commissionPercentage": subUserEntity.commissionPercentage,
    //   "canAddSubUsers": subUserEntity.canAddSubUsers,
    // }

    final subUserData = subUserEntity.toJson();
    final response = await dioConsumer.post(PortalRemoteConstants.createSubUser,
        body: subUserData);
    return response;
  }

  @override
  Future deleteSubUser(int id) async {
    final response = await dioConsumer
        .delete(PortalRemoteConstants.deleteSubUser + id.toString());

    return response;
  }

  @override
  Future getAllSubUsers() async {
    final response =
        await dioConsumer.get(PortalRemoteConstants.getAllSubUsers);
    final List<SubUser> subUsers = [];
    for (var element in (response.data['subUsers'] as List)) {
      subUsers.add(SubUser.fromJson(element));
    }

    return subUsers;
  }

  @override
  Future getSubUser() {
    // TODO: implement getSubUser
    throw UnimplementedError();
  }

  @override
  Future updateSubUser(SubUserEntity subUser) {
    // TODO: implement updateSubUser
    throw UnimplementedError();
  }
}
