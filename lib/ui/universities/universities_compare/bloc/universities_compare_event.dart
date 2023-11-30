part of 'universities_compare_bloc.dart';

abstract class UniversitiesCompareEvent {}

class UniversitiesCompareStarted extends UniversitiesCompareEvent {}

class UniversitiesCompareClicked extends UniversitiesCompareEvent {
  final int firstSchoolId;
  final int secondSchoold;

  UniversitiesCompareClicked(
      {required this.firstSchoolId, required this.secondSchoold});
}
