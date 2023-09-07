part of 'universities_bloc.dart';

@immutable
abstract class UniversitiesState {}

class UniversitiesInitial extends UniversitiesState {}

class UniversitiesSuccess extends UniversitiesState {
  final List<School> schools;
  final List<City> cities;

  UniversitiesSuccess(this.schools, this.cities);
}

class UniversitySuccess extends UniversitiesState {
  final School school;
  final List<City> cities;

  UniversitySuccess(this.school, this.cities);
}

class UniversitiesCompareSuccess extends UniversitiesState {
  final School firstSchool;
  final School secondSchool;
  final List<City> cities;

  UniversitiesCompareSuccess(this.firstSchool, this.secondSchool, this.cities);
}

class UniversitiesError extends UniversitiesState {}
