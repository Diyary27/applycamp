import 'package:applycamp/domain/entity/sub_user.dart';

abstract class SubUserRepository {
  Future getAllSubUsers();
  Future getSubUser();
  Future createSubUser(SubUserEntity subUserEntity);
  Future updateSubUser(SubUserEntity subUserEntity);
  Future deleteSubUser(int id);
}
