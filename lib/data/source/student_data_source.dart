import 'dart:io';
import 'package:applycamp/core/common/dio_consumer.dart';
import 'package:applycamp/core/constant/remote_constant.dart';
import 'package:applycamp/data/model/application_models/document_type.dart';
import 'package:applycamp/data/model/file_element.dart';
import 'package:applycamp/data/model/program_search_models/degrees.dart';
import 'package:applycamp/data/model/student_model/nationality.dart';
import 'package:applycamp/data/model/student_model/student_document.dart';
import 'package:applycamp/data/model/student_model/student_model.dart';
import 'package:applycamp/domain/entity/student_create_fields.dart';
import 'package:applycamp/domain/entity/student_create_params.dart';
import 'package:dio/dio.dart';

abstract class StudentDataSource {
  Future getAllMyStudents();
  Future getStudentById(int studentId);
  Future getStudentCreateFields();
  Future deleteStudent(int studentId);
  Future uploadStudentPhoto(File image);
  Future uploadStudentDocument(File document, int documentTypeId);
  Future createStudent(StudentCreateParams studentCreateParams);
}

class StudentDataSourceImpl implements StudentDataSource {
  final PortalDioConsumer dioConsumer;

  StudentDataSourceImpl(this.dioConsumer);

  @override
  Future getAllMyStudents() async {
    final response =
        await dioConsumer.get(PortalRemoteConstants.getLoggedInUserStudents);

    final List<Student> students = [];
    for (var student in (response.data['students'] as List)) {
      students.add(Student.fromJson(student));
    }

    return students;
  }

  @override
  Future getStudentCreateFields() async {
    final documentTypesResponse =
        await dioConsumer.post(PortalRemoteConstants.getStudentDocumentTypes);
    final createFieldsResponse =
        await dioConsumer.get(PortalRemoteConstants.getFieldsToModifyStudent);

    final documentTypes = <DocumentType>[];
    final degrees = <Degree>[];
    final nations = <Nationality>[];

    for (var element in (documentTypesResponse.data["documentTypes"] as List)) {
      documentTypes.add(DocumentType.fromJson(element));
    }
    for (var element in (createFieldsResponse.data["degrees"] as List)) {
      degrees.add(Degree.fromJson(element));
    }
    for (var element in (createFieldsResponse.data["nations"] as List)) {
      nations.add(Nationality.fromJson(element));
    }

    final StudentCreateFields studentCreateFields = StudentCreateFields(
        documentTypes: documentTypes, degrees: degrees, nations: nations);

    return studentCreateFields;
  }

  @override
  Future getStudentById(int studentId) async {
    final response = await dioConsumer
        .get(PortalRemoteConstants.getStudentById + studentId.toString());

    final student = Student.fromJson(response.data["student"]);

    return student;
  }

  @override
  Future deleteStudent(int studentId) async {
    final response = await dioConsumer
        .delete(PortalRemoteConstants.getStudentById + studentId.toString());
    return response;
  }

  @override
  Future uploadStudentPhoto(File image) async {
    final response = await dioConsumer.post(
      PortalRemoteConstants.uploadStudentPhoto,
      body: FormData.fromMap(
        {
          "image": await MultipartFile.fromFile(image.path),
        },
      ),
    );

    final FileElement imageResponse =
        FileElement.fromJson(response.data["image"]);

    return imageResponse;
  }

  @override
  Future uploadStudentDocument(File document, int documentTypeId) async {
    final response = await dioConsumer.post(
      PortalRemoteConstants.uploadDocument +
          documentTypeId.toString() +
          "/upload",
      body: FormData.fromMap(
        {
          "file": await MultipartFile.fromFile(document.path),
        },
      ),
    );

    final FileElement fileResponse =
        FileElement.fromJson(response.data["file"]);

    return fileResponse;
  }

  @override
  Future createStudent(StudentCreateParams studentCreateParams) async {
    final response = await dioConsumer.post(
      PortalRemoteConstants.createStudent,
      body: {
        if (studentCreateParams.nationalityId != null &&
            studentCreateParams.nationalityId != '')
          "nationalityId": studentCreateParams.nationalityId,
        if (studentCreateParams.residenceId != null &&
            studentCreateParams.residenceId != '')
          "residenceId": studentCreateParams.residenceId,
        if (studentCreateParams.visaId != null &&
            studentCreateParams.visaId != '')
          "visaId": studentCreateParams.visaId,
        if (studentCreateParams.highSchoolCountryId != null &&
            studentCreateParams.highSchoolCountryId != '')
          "highSchoolCountryId": studentCreateParams.highSchoolCountryId,
        if (studentCreateParams.degreeId != null &&
            studentCreateParams.degreeId != '')
          "degreeId": studentCreateParams.degreeId,
        "image": studentCreateParams.image?.toJson(),
        if (studentCreateParams.email != null &&
            studentCreateParams.email != '')
          "email": studentCreateParams.email,
        if (studentCreateParams.fullName != null &&
            studentCreateParams.fullName != '')
          "fullName": studentCreateParams.fullName,
        if (studentCreateParams.phone != null &&
            studentCreateParams.phone != '')
          "phone": studentCreateParams.phone,
        if (studentCreateParams.passportNumber != null &&
            studentCreateParams.passportNumber != '')
          "passportNumber": studentCreateParams.passportNumber,
        if (studentCreateParams.passportDateOfIssue != null &&
            studentCreateParams.passportDateOfIssue != '')
          "passportDateOfIssue":
              "${studentCreateParams.passportDateOfIssue!.year.toString().padLeft(4, '0')}-${studentCreateParams.passportDateOfIssue!.month.toString().padLeft(2, '0')}-${studentCreateParams.passportDateOfIssue!.day.toString().padLeft(2, '0')}",
        if (studentCreateParams.passportDateOfExpiry != null &&
            studentCreateParams.passportDateOfExpiry != '')
          "passportDateOfExpiry":
              "${studentCreateParams.passportDateOfExpiry!.year.toString().padLeft(4, '0')}-${studentCreateParams.passportDateOfExpiry!.month.toString().padLeft(2, '0')}-${studentCreateParams.passportDateOfExpiry!.day.toString().padLeft(2, '0')}",
        if (studentCreateParams.dateOfBirth != null &&
            studentCreateParams.dateOfBirth != '')
          "dateOfBirth":
              "${studentCreateParams.dateOfBirth!.year.toString().padLeft(4, '0')}-${studentCreateParams.dateOfBirth!.month.toString().padLeft(2, '0')}-${studentCreateParams.dateOfBirth!.day.toString().padLeft(2, '0')}",
        if (studentCreateParams.gender != null &&
            studentCreateParams.gender != '')
          "gender": studentCreateParams.gender,
        if (studentCreateParams.martialStatus != null &&
            studentCreateParams.martialStatus != '')
          "martialStatus": studentCreateParams.martialStatus,
        if (studentCreateParams.fatherName != null &&
            studentCreateParams.fatherName != '')
          "fatherName": studentCreateParams.fatherName,
        if (studentCreateParams.fatherPhone != null &&
            studentCreateParams.fatherPhone != '')
          "fatherPhone": studentCreateParams.fatherPhone,
        if (studentCreateParams.motherName != null &&
            studentCreateParams.motherName != '')
          "motherName": studentCreateParams.motherName,
        if (studentCreateParams.highSchool != null &&
            studentCreateParams.highSchool != '')
          "highSchool": studentCreateParams.highSchool,
        if (studentCreateParams.gpa != null && studentCreateParams.gpa != '')
          "gpa": studentCreateParams.gpa,
        if (studentCreateParams.tcNumber != null &&
            studentCreateParams.tcNumber != '')
          "tcNumber": studentCreateParams.tcNumber,
        if (studentCreateParams.addressAbroad != null &&
            studentCreateParams.addressAbroad != '')
          "addressAbroad": studentCreateParams.addressAbroad,
        if (studentCreateParams.addressTurkey != null &&
            studentCreateParams.addressTurkey != '')
          "addressTurkey": studentCreateParams.addressTurkey,
        if (studentCreateParams.hasTcNumber != null &&
            studentCreateParams.hasTcNumber != '')
          "hasTcNumber": studentCreateParams.hasTcNumber,
        if (studentCreateParams.isTransferred != null &&
            studentCreateParams.isTransferred != '')
          "isTransferred": studentCreateParams.isTransferred,
        if (studentCreateParams.isTurkeyCitizen != null &&
            studentCreateParams.isTurkeyCitizen != '')
          "isTurkeyCitizen": studentCreateParams.isTurkeyCitizen,
        if (studentCreateParams.isVisaRequired != null &&
            studentCreateParams.isVisaRequired != '')
          "isVisaRequired": studentCreateParams.isVisaRequired,
        if (studentCreateParams.isLoginAllowed != null &&
            studentCreateParams.isLoginAllowed != '')
          "isLoginAllowed": studentCreateParams.isLoginAllowed,
        if (studentCreateParams.password != null &&
            studentCreateParams.password != '')
          "password": studentCreateParams.password,
        if (studentCreateParams.documents.isNotEmpty)
          "documents":
              studentCreateParams.documents.map((x) => x?.toJson()).toList(),
        "id": '0',
      },
      contentType: "application/json",
    );

    return response;
  }
}
