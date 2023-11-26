import 'dart:io';

abstract class UserRepository {
  Future getDashboard();
  Future uploadProfilePhoto(File photo);
}
