import 'package:applycamp/data/model/user_model/user.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/agent_auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(UserProfileInitial()) {
    on<UserProfileEvent>((event, emit) async {
      try {
        if (event is UserProfileStarted) {
          final userProfile =
              await instance<AgentAuthRepository>().getProfile();

          emit(UserProfilLoaded(userProfile));
        }
        if (event is UserProfileUpdateClicked) {
          // final response = await instance<AgentAuthRepository>().editProfile();

          // emit(UserProfileUpdateSuccess());
        }
      } catch (e) {
        emit(UserProfileError());
      }
    });
  }
}
