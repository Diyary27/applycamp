part of 'cities_bloc.dart';

@immutable
abstract class CitiesState {}

class CitiesInitial extends CitiesState {}

class CitiesSuccess extends CitiesState {
  final List<City> cities;

  CitiesSuccess(this.cities);
}

class CityPageSuccess extends CitiesState {
  final City city;

  CityPageSuccess(this.city);
}

class CitySchoolsSuccess extends CitiesState {
  final List<School> schools;
  final List<City> cities;

  CitySchoolsSuccess({required this.schools, required this.cities});
}

class CitiesError extends CitiesState {}
