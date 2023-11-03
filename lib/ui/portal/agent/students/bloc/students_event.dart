part of 'students_bloc.dart';

abstract class StudentsEvent {}

class StudentsStarted extends StudentsEvent {}

class StudentDeleteClicked extends StudentsEvent {
  final int studentId;

  StudentDeleteClicked(this.studentId);
}
