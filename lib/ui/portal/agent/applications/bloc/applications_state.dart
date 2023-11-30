part of 'applications_bloc.dart';

abstract class ApplicationsState {}

class ApplicationsInitial extends ApplicationsState {}

class ApplicationsLoaded extends ApplicationsState {
  final List<Application> applications;
  final List<ApplicationStatus> status;
  final List<Student> students;
  final List<School> schools;
  final List<SchoolProgram> programs;

  ApplicationsLoaded({
    required this.applications,
    required this.status,
    required this.students,
    required this.schools,
    required this.programs,
  });
}

class ApplicationEditLoaded extends ApplicationsState {
  final ApplicationCreateFields createFields;
  final Application application;
  final String? message;

  ApplicationEditLoaded({
    required this.createFields,
    required this.application,
    this.message,
  });
}

class ApplicationCreateLoaded extends ApplicationsState {
  final ApplicationCreateFields createFields;
  final String? message;

  ApplicationCreateLoaded({
    required this.createFields,
    this.message,
  });
}

class ApplicationsError extends ApplicationsState {}
