import 'package:applycamp/data/model/program_search_models/study_fields.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/search_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<CategoriesStarted>((event, emit) async {
      try {
        final studyFields =
            await instance<SearchRepository>().getAllStudyFields();
        emit(CategoriesSuccess(studyFields));
      } catch (e) {
        emit(CategoriesError());
      }
    });
  }
}
