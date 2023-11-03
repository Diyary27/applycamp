part of 'application_details_bloc.dart';

abstract class ApplicationDetailsEvent {}

class ApplicationDetailsStarted extends ApplicationDetailsEvent {
  final int applicationId;

  ApplicationDetailsStarted(this.applicationId);
}
