import 'package:applycamp/data/model/file_element.dart';
import 'package:applycamp/data/model/student_model/student_document.dart';
import 'package:applycamp/data/model/student_model/student_model.dart';
import 'package:applycamp/di/service_locator.dart';
import 'package:applycamp/domain/entity/student_create_fields.dart';
import 'package:applycamp/domain/entity/student_create_params.dart';
import 'package:applycamp/domain/repository/student_repository.dart';
import 'package:bloc/bloc.dart';

part 'student_create_event.dart';
part 'student_create_state.dart';

class StudentCreateBloc extends Bloc<StudentCreateEvent, StudentCreateState> {
  StudentCreateBloc() : super(StudentCreateInitial()) {
    on<StudentCreateEvent>((event, emit) async {
      try {
        if (event is StudentCreateStarted) {
          final studentCreateFields =
              await instance<StudentRepository>().getStudentCreateFields();
          emit(StudentCreateLoaded(studentCreateFields));
        }
        if (event is StudentCreateBtnClicked) {
          final List<StudentDocument> documents = [];
          final StudentCreateParams studentCreateParams = StudentCreateParams(
              nationalityId: event.nationalityId,
              residenceId: event.residenceId,
              visaId: 000000,
              highSchoolCountryId: event.highSchoolCountryId,
              degreeId: event.degreeId,
              image: event.photo,
              email: event.email,
              fullName: event.fullName,
              phone: event.phone,
              passportNumber: event.passPortNumber,
              passportDateOfIssue: event.passPortDateofIssue,
              passportDateOfExpiry: event.passPortDateofExpiry,
              dateOfBirth: event.birthDate,
              gender: event.gender,
              martialStatus: event.maritalStatus,
              fatherName: event.fatherName,
              fatherPhone: event.fatherPhone,
              motherName: event.motherName,
              highSchool: event.highSchool,
              gpa: event.gpa,
              tcNumber: null,
              addressAbroad: event.addressAbroad,
              addressTurkey: event.turkeyAddress,
              hasTcNumber: false,
              isTransferred: event.isTransfered,
              isTurkeyCitizen: event.isTurkeyCitizen,
              isVisaRequired: event.isVisaRequired,
              isLoginAllowed: false,
              password: null,
              documents: event.documents,
              id: null);

          final createResponse = await instance<StudentRepository>()
              .createStudent(studentCreateParams);
        }
      } catch (e) {
        emit(StudentCreateError());
      }
    });
  }
}
