import 'package:applycamp/core/common/dio_consumer.dart';
import 'package:applycamp/core/constant/remote_constant.dart';
import 'package:applycamp/domain/entity/sub_user.dart';

abstract class SubUserDataSource {
  Future getAllSubUsers();
  Future getSubUser();
  Future createSubUser(SubUserEntity subUser);
  Future updateSubUser(SubUserEntity subUser);
  Future deleteSubUser(int id);
}

class SubUserDataSourceImpl implements SubUserDataSource {
  final PortalDioConsumer dioConsumer;

  SubUserDataSourceImpl(this.dioConsumer);

  @override
  Future createSubUser(SubUserEntity subUser) {
    // TODO: implement createSubUser
    throw UnimplementedError();
  }

  @override
  Future deleteSubUser(int id) {
    // TODO: implement deleteSubUser
    throw UnimplementedError();
  }

  @override
  Future getAllSubUsers() async {
    final response =
        await dioConsumer.get(PortalRemoteConstants.getAllSubUsers);
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
