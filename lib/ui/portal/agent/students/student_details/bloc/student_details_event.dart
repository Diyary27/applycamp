part of 'student_details_bloc.dart';

abstract class StudentDetailsEvent {}

class StudentDetailsStarted extends StudentDetailsEvent {
  final int StudentId;

  StudentDetailsStarted(this.StudentId);
}

class StudentApplicationsStarted extends StudentDetailsEvent {
  final int StudentId;

  StudentApplicationsStarted(this.StudentId);
}
