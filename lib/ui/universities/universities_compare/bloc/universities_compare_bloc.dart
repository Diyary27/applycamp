import 'package:applycamp/data/model/program_search_models/city.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'universities_compare_event.dart';
part 'universities_compare_state.dart';

class UniversitiesCompareBloc
    extends Bloc<UniversitiesCompareEvent, UniversitiesCompareState> {
  UniversitiesCompareBloc() : super(UniversitiesCompareInitial()) {
    on<UniversitiesCompareEvent>((event, emit) async {
      // TODO: implement event handler
    });
  }
}
