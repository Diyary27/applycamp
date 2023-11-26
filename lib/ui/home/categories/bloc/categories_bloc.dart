import 'package:applycamp/data/model/program_search_models/school_programs.dart';
import 'package:applycamp/data/model/program_search_models/study_fields.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/repository/search_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<CategoriesEvent>((event, emit) async {
      try {
        if (event is CategoriesStarted) {
          final studyFields =
              await instance<SearchRepository>().getAllStudyFields();
          emit(CategoriesSuccess(studyFields));
        }
        if (event is CategoryClicked) {
          final programs = await instance<SearchRepository>()
              .getProgramsByStudyField(event.id);
          emit(CategoryProgramSuccess(programs));
        }
      } catch (e) {
        emit(CategoriesError());
      }
    });
  }
}
