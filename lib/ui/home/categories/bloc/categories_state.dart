part of 'categories_bloc.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final List<StudyField> studyFields;

  CategoriesSuccess(this.studyFields);
}

class CategoriesError extends CategoriesState {}
