import 'package:applycamp/data/model/student_model/student_model.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/student_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'students_event.dart';
part 'students_state.dart';

class StudentsBloc extends Bloc<StudentsEvent, StudentsState> {
  StudentsBloc() : super(StudentsInitial()) {
    on<StudentsEvent>((event, emit) async {
      if (event is StudentsStarted) {
        final List<Student> students =
            await instance<StudentRepository>().getAllMyStudents();
        emit(StudentsLoaded(students));
      }
    });
  }
}
