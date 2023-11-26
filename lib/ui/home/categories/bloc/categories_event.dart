part of 'categories_bloc.dart';

@immutable
abstract class CategoriesEvent {}

class CategoriesStarted extends CategoriesEvent {}

class CategoryClicked extends CategoriesEvent {
  final int id;

  CategoryClicked(this.id);
}
