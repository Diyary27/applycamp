import 'package:applycamp/data/model/application_models/application.dart';
import 'package:applycamp/data/model/application_models/application_status.dart';
import 'package:applycamp/data/model/program_search_models/program.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:applycamp/data/model/program_search_models/school_programs.dart';
import 'package:applycamp/data/model/student_model/student_model.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/entity/program_search_params.dart';
import 'package:applycamp/domain/repository/application_repository.dart';
import 'package:applycamp/domain/repository/search_repository.dart';
import 'package:applycamp/domain/repository/student_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

part 'applications_event.dart';
part 'applications_state.dart';

class ApplicationsBloc extends Bloc<ApplicationsEvent, ApplicationsState> {
  ApplicationsBloc() : super(ApplicationsInitial()) {
    on<ApplicationsEvent>((event, emit) async {
      try {
        if (event is ApplicationsStarted) {
          final applications =
              await instance<ApplicationRepository>().getMyApplications();
          final status = await instance<ApplicationRepository>().getAllStatus();
          final List<Student> students =
              await instance<StudentRepository>().getAllMyStudents();
          final List<School> schools =
              await instance<SearchRepository>().getAllSchools();
          // final List<Program> allProgrmas = await instance<SearchRepository>()
          //     .searchPrograms(SearchParams(onlyUsedPrograms: true));

          // // programs List
          // final List<ValueItem> programs = [];
          // allProgrmas.forEach((element) {
          //   programs.add(
          //       ValueItem(label: element.title, value: element.id.toString()));
          // });

          emit(ApplicationsLoaded(
            applications: applications,
            status: status,
            students: students,
            schools: schools,
            programs: [],
          ));
        } else if (event is ApplicationsFilterClicked) {
          emit(ApplicationsInitial());

          final applications =
              await instance<ApplicationRepository>().getMyApplicationsByFilter(
            statusId: event.statusId,
            studentId: event.studentId,
            schoolId: event.schoolId,
          );
          final status = await instance<ApplicationRepository>().getAllStatus();
          final List<Student> students =
              await instance<StudentRepository>().getAllMyStudents();
          final List<School> schools =
              await instance<SearchRepository>().getAllSchools();

          emit(ApplicationsLoaded(
            applications: applications,
            status: status,
            students: students,
            schools: schools,
            programs: [],
          ));
        }
      } catch (e) {
        emit(ApplicationsError());
      }
    });
  }
}
