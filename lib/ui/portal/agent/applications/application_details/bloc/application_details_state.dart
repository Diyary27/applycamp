part of 'application_details_bloc.dart';

abstract class ApplicationDetailsState {}

class ApplicationDetailsInitial extends ApplicationDetailsState {}

class ApplicationDetailsSuccess extends ApplicationDetailsState {
  final Application application;

  ApplicationDetailsSuccess(this.application);
}

class ApplicationDetailsError extends ApplicationDetailsState {}
