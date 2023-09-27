import 'package:applycamp/data/model/program_search_models/city.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/search_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cities_event.dart';
part 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  CitiesBloc() : super(CitiesInitial()) {
    on<CitiesStarted>((event, emit) async {
      try {
        final cities = await instance<SearchRepository>().getAllCities();
        emit(CitiesSuccess(cities));
      } catch (e) {
        emit(CitiesError());
      }
    });
  }
}
