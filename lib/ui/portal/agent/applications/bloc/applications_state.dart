part of 'applications_bloc.dart';

abstract class ApplicationsState {}

class ApplicationsInitial extends ApplicationsState {}

class ApplicationsLoaded extends ApplicationsState {}

class ApplicationsError extends ApplicationsState {}
