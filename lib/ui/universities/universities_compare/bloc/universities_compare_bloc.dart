import 'package:applycamp/data/model/program_search_models/city.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/school_repository.dart';
import 'package:applycamp/domain/repository/search_repository.dart';
import 'package:bloc/bloc.dart';

part 'universities_compare_event.dart';
part 'universities_compare_state.dart';

class UniversitiesCompareBloc
    extends Bloc<UniversitiesCompareEvent, UniversitiesCompareState> {
  UniversitiesCompareBloc() : super(UniversitiesCompareInitial()) {
    on<UniversitiesCompareEvent>((event, emit) async {
      if (event is UniversitiesCompareStarted) {
      } else if (event is UniversitiesCompareClicked) {
        final firstSchool = await instance<SchoolRepository>()
            .getSchoolById(event.firstSchoolId);

        final secondSchool = await instance<SchoolRepository>()
            .getSchoolById(event.secondSchoold);

        final cities = await instance<SearchRepository>().getAllCities();

        emit(UniversitiesCompareSuccess(
            firstSchool: firstSchool,
            secondSchool: secondSchool,
            cities: cities));
      }
    });
  }
}
