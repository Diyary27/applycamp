import 'package:applycamp/data/model/application_models/application.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/application_repository.dart';
import 'package:bloc/bloc.dart';

part 'application_details_event.dart';
part 'application_details_state.dart';

class ApplicationDetailsBloc
    extends Bloc<ApplicationDetailsEvent, ApplicationDetailsState> {
  ApplicationDetailsBloc() : super(ApplicationDetailsInitial()) {
    on<ApplicationDetailsEvent>((event, emit) async {
      try {
        if (event is ApplicationDetailsStarted) {
          final application = await instance<ApplicationRepository>()
              .getAnApplication(event.applicationId);
          emit(ApplicationDetailsSuccess(application));
        }
      } catch (e) {
        emit(ApplicationDetailsError());
      }
    });
  }
}
