part of 'search_bloc.dart';

abstract class SearchEvent {}

class SearchPageStarted extends SearchEvent {}

class SearchProgramBtnClicked extends SearchEvent {
  final List<ValueItem> degrees;
  final List<ValueItem> languages;
  final List<ValueItem> schoolTypes;
  final List<ValueItem> cities;
  final List<ValueItem> universities;
  final int? minPrice;
  final int? maxPrice;
  final String keyWords;

  SearchProgramBtnClicked(
      {required this.degrees,
      required this.languages,
      required this.schoolTypes,
      required this.cities,
      required this.universities,
      required this.minPrice,
      required this.maxPrice,
      required this.keyWords});
}

class SearchUniBtnClicked extends SearchEvent {}
