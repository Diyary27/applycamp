import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'applications_event.dart';
part 'applications_state.dart';

class ApplicationsBloc extends Bloc<ApplicationsEvent, ApplicationsState> {
  ApplicationsBloc() : super(ApplicationsInitial()) {
    on<ApplicationsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
