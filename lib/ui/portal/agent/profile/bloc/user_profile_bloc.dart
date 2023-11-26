import 'package:applycamp/data/model/user_model/user.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/entity/profile_fields.dart';
import 'package:applycamp/domain/repository/agent_auth_repository.dart';
import 'package:bloc/bloc.dart';

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
          final ProfileFields profileFields = ProfileFields(
            password: event.password,
            name: event.name,
            organization: event.organization,
            profileImage: event.uploadedImage,
          );
          final response =
              await instance<AgentAuthRepository>().editProfile(profileFields);

          response == true
              ? emit(UserProfileUpdateSuccess())
              : UserProfileError();
        }
      } catch (e) {
        emit(UserProfileError());
      }
    });
  }
}
