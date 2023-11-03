import 'package:applycamp/data/model/student_model/student_model.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/student_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'student_details_event.dart';
part 'student_details_state.dart';

class StudentDetailsBloc
    extends Bloc<StudentDetailsEvent, StudentDetailsState> {
  StudentDetailsBloc() : super(StudentDetailsInitial()) {
    on<StudentDetailsEvent>((event, emit) async {
      try {
        if (event is StudentDetailsStarted) {
          final student = await instance<StudentRepository>()
              .getStudentById(event.StudentId);
          emit(StudentDetailsSuccess(student));
        } else if (event is StudentApplicationsStarted) {
          final student = await instance<StudentRepository>()
              .getStudentById(event.StudentId);
          emit(StudentApplicationsSuccess(student));
        }
      } catch (e) {
        emit(StudentDetailsError());
      }
    });
  }
}
