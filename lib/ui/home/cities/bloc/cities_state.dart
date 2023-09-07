part of 'cities_bloc.dart';

@immutable
abstract class CitiesState {}

class CitiesInitial extends CitiesState {}

class CitiesSuccess extends CitiesState {
  final List<City> cities;

  CitiesSuccess(this.cities);
}

class CitiesError extends CitiesState {}

class CityPageSuccess extends CitiesState {
  final City city;

  CityPageSuccess(this.city);
}
