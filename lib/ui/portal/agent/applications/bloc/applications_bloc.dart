import 'package:applycamp/data/model/application_models/application.dart';
import 'package:applycamp/data/model/application_models/application_create_fields.dart';
import 'package:applycamp/data/model/application_models/application_create_response.dart';
import 'package:applycamp/data/model/application_models/application_status.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';
import 'package:applycamp/data/model/program_search_models/school_programs.dart';
import 'package:applycamp/data/model/student_model/student_model.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/entity/application_create_params.dart';
import 'package:applycamp/domain/repository/application_repository.dart';
import 'package:applycamp/domain/repository/search_repository.dart';
import 'package:applycamp/domain/repository/student_repository.dart';
import 'package:bloc/bloc.dart';

part 'applications_event.dart';
part 'applications_state.dart';

class ApplicationsBloc extends Bloc<ApplicationsEvent, ApplicationsState> {
  ApplicationsBloc() : super(ApplicationsInitial()) {
    on<ApplicationsEvent>((event, emit) async {
      try {
        if (event is ApplicationsStarted) {
          emit(ApplicationsInitial());

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
        } else if (event is ApplicationEditStarted) {
          emit(ApplicationsInitial());

          final createFields = await instance<ApplicationRepository>()
              .getCreateApplicationFields(event.studentId);
          final application = await instance<ApplicationRepository>()
              .getAnApplication(event.applicationtId);
          emit(ApplicationEditLoaded(
              createFields: createFields, application: application));
        } else if (event is ApplicationEditBtnClicked) {
          emit(ApplicationsInitial());

          final applicationCreateParams = ApplicationCreateParams(
            schoolId: event.schoolId,
            degreeId: event.degreeId,
            programId: event.programId,
            semesterId: event.semesterId,
          );

          final ApplicationCreateResponse applicationCreateResponse =
              await instance<ApplicationRepository>().editApplication(
                  applicationCreateParams, event.applicationId);

          final createFields = await instance<ApplicationRepository>()
              .getCreateApplicationFields(event.studentId);

          final application = await instance<ApplicationRepository>()
              .getAnApplication(event.applicationId);

          emit(ApplicationEditLoaded(
            createFields: createFields,
            application: application,
            message: applicationCreateResponse.message,
          ));
        } else if (event is ApplicationCreateStarted) {
          final createFields = await instance<ApplicationRepository>()
              .getCreateApplicationFields(event.studentId);
          emit(ApplicationCreateLoaded(createFields: createFields));
        } else if (event is ApplicationCreateBtnClicked) {
          emit(ApplicationsInitial());
          final applicationCreateFields = ApplicationCreateParams(
            schoolId: event.schoolId,
            degreeId: event.degreeId,
            programId: event.programId,
            semesterId: event.semesterId,
          );
          final ApplicationCreateResponse applicationCreateResponse =
              await instance<ApplicationRepository>()
                  .createApplication(applicationCreateFields, event.studentId);
          final createFields = await instance<ApplicationRepository>()
              .getCreateApplicationFields(event.studentId);
          emit(ApplicationCreateLoaded(
            createFields: createFields,
            message: applicationCreateResponse.message,
          ));
        }
      } catch (e) {
        emit(ApplicationsError());
      }
    });
  }
}
