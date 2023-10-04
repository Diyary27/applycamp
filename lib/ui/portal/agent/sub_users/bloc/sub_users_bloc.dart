import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sub_users_event.dart';
part 'sub_users_state.dart';

class SubUsersBloc extends Bloc<SubUsersEvent, SubUsersState> {
  SubUsersBloc() : super(SubUsersInitial()) {
    on<SubUsersEvent>((event, emit) {
      if (event is SubUserStarted) {
        emit(SubUsersLoaded());
      }
    });
  }
}
