part of 'student_details_bloc.dart';

abstract class StudentDetailsState {}

class StudentDetailsInitial extends StudentDetailsState {}

class StudentDetailsSuccess extends StudentDetailsState {
  final Student student;

  StudentDetailsSuccess(this.student);
}

class StudentApplicationsSuccess extends StudentDetailsState {
  final Student student;

  StudentApplicationsSuccess(this.student);
}

class StudentDetailsError extends StudentDetailsState {}
