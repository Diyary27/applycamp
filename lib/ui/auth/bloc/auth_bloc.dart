import 'package:applycamp/data/model/student_model/student_auth_response.dart';
import 'package:applycamp/data/model/user_model/user_auth_response.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/agent_auth_repository.dart';
import 'package:applycamp/domain/repository/student_auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final StudentAuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      // student authorization
      if (event is StudentAuthStarted) {
        if (event.isLoginMode == true) {
          emit(StudentAuthLoginLoaded());
        } else if (event.isLoginMode == false && event.isForgotPass == false) {
          emit(StudentAuthRegisterLoaded());
        } else if (event.isForgotPass == true) {
          emit(StudentAuthForgotPassLoaded());
        }
      }
      try {
        if (event is StudentAuthLoginBtnClicked) {
          final loginResponse = await instance<StudentAuthRepository>()
              .login(event.email, event.password);
          emit(StudentAuthLoginSuccess(loginResponse));
        } else if (event is StudentAuthRegisterBtnClicked) {
          final registerResponse = await instance<StudentAuthRepository>()
              .register(
                  fullName: event.fullName,
                  email: event.email,
                  password: event.password,
                  gender: event.gender,
                  phone: event.phone);
          emit(StudentAuthRegisterSuccess(registerResponse));
        } else if (event is StudentAuthForgotPassBtnClicked) {
          final response = await instance<StudentAuthRepository>()
              .sendForgotPassEmail(event.email);
          emit(StudentAuthForgotPassEmailSent(response));
        }
      } catch (e) {
        emit(AuthError("Error"));
      }

      // agent authorization
      if (event is AgentAuthStarted) {
        if (event.isLoginMode == true) {
          emit(AgentAuthLoginLoaded());
        } else if (event.isLoginMode == false && event.isForgotPass == false) {
          emit(AgentAuthRegisterLoaded());
        } else if (event.isForgotPass == true) {
          emit(AgentAuthForgotPassLoaded());
        }
      }
      try {
        if (event is AgentAuthLoginBtnClicked) {
          final loginResponse = await instance<AgentAuthRepository>()
              .login(event.email, event.password);
          emit(AgentAuthLoginSuccess(loginResponse));
        } else if (event is AgentAuthRegisterBtnClicked) {
          final registerResponse =
              await instance<AgentAuthRepository>().register(
            name: event.fullName,
            email: event.email,
            password: event.password,
            organization: event.organization,
            phone: event.phone,
          );
          emit(AgentAuthRegisterSuccess(registerResponse));
        } else if (event is AgentAuthForgotPassBtnClicked) {
          final response = await instance<AgentAuthRepository>()
              .sendForgotPassEmail(event.email);
          emit(AgentAuthForgotPassEmailSent(response));
        }
      } catch (e) {
        print(e);
        emit(AuthError("Error"));
      }
    });
  }
}
