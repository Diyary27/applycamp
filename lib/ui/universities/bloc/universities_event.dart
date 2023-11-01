part of 'universities_bloc.dart';

@immutable
abstract class UniversitiesEvent {}

class UniversitiesStarted extends UniversitiesEvent {}

class UniversitiesByCity extends UniversitiesEvent {}

class UniversityDetails extends UniversitiesEvent {
  final int schoolId;

  UniversityDetails(this.schoolId);
}
