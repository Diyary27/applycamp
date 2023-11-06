import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/entity/student_create_fields.dart';
import 'package:applycamp/domain/repository/student_repository.dart';
import 'package:bloc/bloc.dart';

part 'student_create_event.dart';
part 'student_create_state.dart';

class StudentCreateBloc extends Bloc<StudentCreateEvent, StudentCreateState> {
  StudentCreateBloc() : super(StudentCreateInitial()) {
    on<StudentCreateEvent>((event, emit) async {
      try {
        if (event is StudentCreateStarted) {
          final studentCreateFields =
              await instance<StudentRepository>().getStudentCreateFields();
          emit(StudentCreateLoaded(studentCreateFields));
        }
      } catch (e) {
        emit(StudentCreateError());
      }
    });
  }
}
