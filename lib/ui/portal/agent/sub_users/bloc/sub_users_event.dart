part of 'sub_users_bloc.dart';

abstract class SubUsersEvent {}

class SubUserStarted extends SubUsersEvent {}

class SubUsersAddClicked extends SubUsersEvent {
  final SubUserEntity subUserEntity;

  SubUsersAddClicked(this.subUserEntity);
}

class SubUsersUpdateClicked extends SubUsersEvent {
  final SubUserEntity subUserEntity;

  SubUsersUpdateClicked(this.subUserEntity);
}

class SubUserDeleteClicked extends SubUsersEvent {
  final int id;

  SubUserDeleteClicked(this.id);
}
