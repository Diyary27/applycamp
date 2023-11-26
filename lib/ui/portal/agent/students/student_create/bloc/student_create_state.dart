part of 'student_create_bloc.dart';

abstract class StudentCreateState {}

class StudentCreateInitial extends StudentCreateState {}

class StudentCreateLoaded extends StudentCreateState {
  final StudentCreateFields studentCreateFields;

  StudentCreateLoaded(this.studentCreateFields);
}

class StudentCreateSuccess extends StudentCreateState {}

class StudentCreateError extends StudentCreateState {}
