import 'package:applycamp/data/model/program_search_models/city.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/search_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'universities_event.dart';
part 'universities_state.dart';

class UniversitiesBloc extends Bloc<UniversitiesEvent, UniversitiesState> {
  UniversitiesBloc() : super(UniversitiesInitial()) {
    on<UniversitiesStarted>((event, emit) async {
      try {
        final schoolsList = await instance<SearchRepository>().getAllSchools();
        final citiesList = await instance<SearchRepository>().getAllCities();
        emit(UniversitiesSuccess(schoolsList, citiesList));
      } catch (e) {
        emit(UniversitiesError());
      }
    });
  }
}
