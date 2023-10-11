part of 'sub_users_bloc.dart';

abstract class SubUsersState {}

class SubUsersInitial extends SubUsersState {}

class SubUsersLoaded extends SubUsersState {
  final List<SubUser> subUsers;

  SubUsersLoaded(this.subUsers);
}

class SubUsersError extends SubUsersState {}
