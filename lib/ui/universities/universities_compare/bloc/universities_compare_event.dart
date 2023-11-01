part of 'universities_compare_bloc.dart';

abstract class UniversitiesCompareEvent {}

class UniversitiesCompareStarted extends UniversitiesCompareEvent {}

class UniversitiesCompareClicked extends UniversitiesCompareEvent {
  final int firstSchool;
  final int secondSchool;

  UniversitiesCompareClicked(
      {required this.firstSchool, required this.secondSchool});
}
