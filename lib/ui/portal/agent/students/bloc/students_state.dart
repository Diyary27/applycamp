part of 'students_bloc.dart';

abstract class StudentsState {}

class StudentsInitial extends StudentsState {}

class StudentsLoaded extends StudentsState {
  final List<Student> students;
  final String? message;

  StudentsLoaded({required this.students, this.message});
}

class StudentsError extends StudentsState {}
