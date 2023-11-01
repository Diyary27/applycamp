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

  ApplicationEditLoaded(
      {required this.createFields, required this.application});
}

class ApplicationCreateLoaded extends ApplicationsState {
  final ApplicationCreateFields createFields;

  ApplicationCreateLoaded(this.createFields);
}

class ApplicationsError extends ApplicationsState {}
