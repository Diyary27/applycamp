part of 'students_bloc.dart';

abstract class StudentsState {}

class StudentsInitial extends StudentsState {}

class StudentsLoaded extends StudentsState {
  final List<Student> students;

  StudentsLoaded(this.students);
}

class StudentsError extends StudentsState {}
