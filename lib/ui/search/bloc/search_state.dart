part of 'search_bloc.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchPageLoaded extends SearchState {
  final List<ValueItem> degrees;
  final List<ValueItem> languages;
  final List<ValueItem> schoolTypes;
  final List<ValueItem> cities;
  final List<ValueItem> universities;
  // this is for keywords
  final List<String> specialities;

  SearchPageLoaded(
      {required this.degrees,
      required this.languages,
      required this.schoolTypes,
      required this.cities,
      required this.universities,
      required this.specialities});
}

class SearchProgramSuccess extends SearchState {
  final SchoolPrograms schoolPrograms;

  SearchProgramSuccess(this.schoolPrograms);
}

class SearchUniSuccess extends SearchState {}

class SearchError extends SearchState {}
