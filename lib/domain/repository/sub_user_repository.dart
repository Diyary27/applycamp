import 'package:applycamp/domain/entity/sub_user.dart';

abstract class SubUserRepository {
  Future getAllSubUsers();
  Future getSubUser();
  Future createSubUser(SubUserEntity subUser);
  Future updateSubUser(SubUserEntity subUser);
  Future deleteSubUser(int id);
}
