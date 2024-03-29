part of 'universities_compare_bloc.dart';

abstract class UniversitiesCompareState {}

class UniversitiesCompareInitial extends UniversitiesCompareState {}

class UniversitiesCompareSuccess extends UniversitiesCompareState {
  final School firstSchool;
  final School secondSchool;
  final List<City> cities;

  UniversitiesCompareSuccess({
    required this.firstSchool,
    required this.secondSchool,
    required this.cities,
  });
}
