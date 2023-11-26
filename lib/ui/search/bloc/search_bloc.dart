import 'package:applycamp/data/model/program_search_models/city.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:applycamp/data/model/program_search_models/school_programs.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/entity/program_search_params.dart';
import 'package:applycamp/domain/repository/search_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:multi_dropdown/models/value_item.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      try {
        if (event is SearchPageStarted) {
          final programSearchFields =
              await instance<SearchRepository>().getFieldsToSearch();

          // Education Level List
          final List<ValueItem> degrees = [];
          programSearchFields.degrees.forEach((element) {
            degrees.add(
                ValueItem(label: element.title, value: element.id.toString()));
          });
          // Education Language List
          final List<ValueItem> languages = [];
          programSearchFields.studyLanguages.forEach((element) {
            languages.add(
                ValueItem(label: element.title, value: element.id.toString()));
          });
          // University Types List
          final List<ValueItem> schoolTypes = [];
          programSearchFields.schoolTypes.forEach((element) {
            schoolTypes.add(
                ValueItem(label: element.title, value: element.id.toString()));
          });
          // cities List
          final List<ValueItem> cities = [];
          programSearchFields.cities.forEach((element) {
            cities.add(
                ValueItem(label: element.title, value: element.id.toString()));
          });
          // universities List
          final List<ValueItem> universities = [];
          programSearchFields.schools.forEach((element) {
            universities.add(
                ValueItem(label: element.title, value: element.id.toString()));
          });
          // programs autocomplete (temporary)
          final List<String> specialities = [];
          programSearchFields.specialities.forEach((element) {
            specialities.add(element.title);
          });

          emit(SearchPageLoaded(
            degrees: degrees,
            languages: languages,
            schoolTypes: schoolTypes,
            cities: cities,
            universities: universities,
            specialities: specialities,
          ));
        } else if (event is SearchProgramBtnClicked) {
          List degreeIds = [];
          List languageIds = [];
          List schoolTypeIds = [];
          List cityIds = [];
          List schoolIds = [];
          // parse the value model objects and store their value in a list
          for (var element in event.degrees) {
            degreeIds.add(element.value);
          }
          for (var element in event.languages) {
            languageIds.add(element.value);
          }
          for (var element in event.schoolTypes) {
            schoolTypeIds.add(element.value);
          }
          for (var element in event.cities) {
            cityIds.add(element.value);
          }
          for (var element in event.universities) {
            schoolIds.add(element.value);
          }

          // creating an instance of programSearchParams and passing the list items converted to string
          final searchParams = SearchParams(
              degreeIds: degreeIds.join(','),
              languageIds: languageIds.join(','),
              schoolTypeIds: schoolTypeIds.join(','),
              cityIds: cityIds.join(','),
              schoolIds: schoolIds.join(','),
              tuitionFeeLow: event.minPrice,
              tuitionFeeHigh: event.maxPrice,
              keywords: event.keyWords);
          // pass it to repository and there convert it to json map
          final schoolPrograms =
              await instance<SearchRepository>().searchPrograms(searchParams);
          emit(SearchProgramSuccess(schoolPrograms));
        } else if (event is SearchUniBtnClicked) {
          List schoolTypeIds = [];
          List cityIds = [];

          for (var element in event.schoolTypes) {
            schoolTypeIds.add(element.value);
          }
          for (var element in event.cities) {
            cityIds.add(element.value);
          }

          final searhParams = SearchParams(
            schoolTypeIds: schoolTypeIds.join(','),
            cityIds: cityIds.join(','),
          );

          // pass it to repository and there convert it to json map
          final schools =
              await instance<SearchRepository>().searchSchools(searhParams);
          final cities = await instance<SearchRepository>().getAllCities();
          emit(SearchUniSuccess(schools: schools, cities: cities));
        }
      } catch (e) {
        print(e);
        emit(SearchError());
      }
    });
  }
}
