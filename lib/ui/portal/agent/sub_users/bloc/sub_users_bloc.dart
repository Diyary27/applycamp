import 'package:applycamp/data/model/user_model/sub_user.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/entity/sub_user.dart';
import 'package:applycamp/domain/repository/sub_user_repository.dart';
import 'package:bloc/bloc.dart';

part 'sub_users_event.dart';
part 'sub_users_state.dart';

class SubUsersBloc extends Bloc<SubUsersEvent, SubUsersState> {
  SubUsersBloc() : super(SubUsersInitial()) {
    on<SubUsersEvent>((event, emit) async {
      if (event is SubUserStarted) {
        final subUsers = await instance<SubUserRepository>().getAllSubUsers();
        emit(SubUsersLoaded(subUsers));
      } else if (event is SubUsersAddClicked) {
        final response = await instance<SubUserRepository>()
            .createSubUser(event.subUserEntity);
      }
    });
  }
}
