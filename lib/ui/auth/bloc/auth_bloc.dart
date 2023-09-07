import 'package:applycamp/data/model/student_model/student_auth_response.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/student_auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final StudentAuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthStarted) {
        if (event.isLoginMode == true) {
          emit(AuthLoginLoaded());
        } else if (event.isLoginMode == false && event.isForgotPass == false) {
          emit(AuthRegisterLoaded());
        } else if (event.isForgotPass == true) {
          emit(AuthForgotPassLoaded());
        }
      }
      try {
        if (event is AuthLoginBtnClicked) {
          final loginResponse = await instance<StudentAuthRepository>()
              .login(event.email, event.password);
          emit(AuthLoginSuccess(loginResponse));
        } else if (event is AuthRegisterBtnClicked) {
          final registerResponse = await instance<StudentAuthRepository>()
              .register(event.fullName, event.email, event.password,
                  event.gender, event.phone);
          emit(AuthRegisterSuccess(registerResponse));
        } else if (event is AuthForgotPassBtnClicked) {
          final response = await instance<StudentAuthRepository>()
              .sendForgotPassEmail(event.email);
          emit(AuthForgotPassEmailSent(response));
        }
      } catch (e) {
        emit(AuthError("Error"));
      }
    });
  }
}
