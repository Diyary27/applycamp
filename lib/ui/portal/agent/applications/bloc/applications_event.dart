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

class ApplicationEditStarted extends ApplicationsEvent {
  final int studentId;
  final int applicationtId;

  ApplicationEditStarted(
      {required this.studentId, required this.applicationtId});
}

class ApplicationEditBtnClicked extends ApplicationsEvent {
  final int studentId;
  final int? schoolId;
  final int? programId;
  final int? degreeId;
  final String? externalId;
  final int? semesterId;

  ApplicationEditBtnClicked({
    required this.studentId,
    this.schoolId,
    this.programId,
    this.degreeId,
    this.externalId,
    this.semesterId,
  });
}

class ApplicationCreateStarted extends ApplicationsEvent {
  final int studentId;

  ApplicationCreateStarted(this.studentId);
}
