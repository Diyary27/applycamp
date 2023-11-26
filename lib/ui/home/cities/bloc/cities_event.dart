part of 'cities_bloc.dart';

@immutable
abstract class CitiesEvent {}

class CitiesStarted extends CitiesEvent {}

class CityClicked extends CitiesEvent {
  final int id;

  CityClicked(this.id);
}
