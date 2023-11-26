import 'package:applycamp/data/source/sub_user_data_source.dart';
import 'package:applycamp/domain/entity/sub_user.dart';
import 'package:applycamp/domain/repository/sub_user_repository.dart';

class SubUserRepositoryImpl implements SubUserRepository {
  final SubUserDataSource dataSource;

  SubUserRepositoryImpl(this.dataSource);
  @override
  Future createSubUser(SubUserEntity subUserEntity) async {
    return await dataSource.createSubUser(subUserEntity);
  }

  @override
  Future deleteSubUser(int id) async {
    return await dataSource.deleteSubUser(id);
  }

  @override
  Future getAllSubUsers() async {
    return await dataSource.getAllSubUsers();
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
