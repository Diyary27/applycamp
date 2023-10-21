part of 'applications_bloc.dart';

abstract class ApplicationsEvent {}

class ApplicationsStarted extends ApplicationsEvent {}

class ApplicationsFilterClicked extends ApplicationsEvent {
  final int? statusId;
  final int? studentId;
  final int? schoolId;
  final int? programId;

  ApplicationsFilterClicked({
    this.statusId,
    this.studentId,
    this.schoolId,
    this.programId,
  });
}
