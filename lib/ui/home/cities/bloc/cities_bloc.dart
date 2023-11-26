import 'package:applycamp/data/model/program_search_models/city.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:applycamp/data/model/program_search_models/school_programs.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/search_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cities_event.dart';
part 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  CitiesBloc() : super(CitiesInitial()) {
    on<CitiesEvent>((event, emit) async {
      try {
        if (event is CitiesStarted) {
          final cities = await instance<SearchRepository>().getAllCities();
          emit(CitiesSuccess(cities));
        }
        if (event is CityClicked) {
          final schools =
              await instance<SearchRepository>().getSchoolsByCity(event.id);
          final cities = await instance<SearchRepository>().getAllCities();
          emit(CitySchoolsSuccess(schools: schools, cities: cities));
        }
      } catch (e) {
        emit(CitiesError());
      }
    });
  }
}
