import 'package:applycamp/core/common/dio_consumer.dart';
import 'package:applycamp/core/constant/remote_constant.dart';
import 'package:applycamp/data/model/application_models/document_type.dart';
import 'package:applycamp/data/model/program_search_models/degrees.dart';
import 'package:applycamp/data/model/student_model/nationality.dart';
import 'package:applycamp/data/model/student_model/student_document.dart';
import 'package:applycamp/data/model/student_model/student_model.dart';
import 'package:applycamp/domain/entity/student_create_fields.dart';

abstract class StudentDataSource {
  Future getAllMyStudents();
  Future getStudentById(int studentId);
  Future getStudentCreateFields();
  Future deleteStudent(int studentId);
}

class StudentDataSourceImpl implements StudentDataSource {
  final PortalDioConsumer dioConsumer;

  StudentDataSourceImpl(this.dioConsumer);

  @override
  Future getAllMyStudents() async {
    final response =
        await dioConsumer.get(PortalRemoteConstants.getLoggedInUserStudents);

    final List<Student> students = [];
    (response.data['students'] as List).forEach((student) {
      students.add(Student.fromJson(student));
    });

    return students;
  }

  @override
  Future getStudentCreateFields() async {
    final documentTypesResponse =
        await dioConsumer.post(PortalRemoteConstants.getStudentDocumentTypes);
    final createFieldsResponse =
        await dioConsumer.get(PortalRemoteConstants.getFieldsToModifyStudent);

    final documentTypes = <StudentDocument>[];
    final degrees = <Degree>[];
    final nations = <Nationality>[];

    (documentTypesResponse.data["documentTypes"] as List).forEach((element) {
      documentTypes.add(StudentDocument.fromJson(element));
    });
    (createFieldsResponse.data["degrees"] as List).forEach((element) {
      degrees.add(Degree.fromJson(element));
    });
    (createFieldsResponse.data["nations"] as List).forEach((element) {
      nations.add(Nationality.fromJson(element));
    });

    final StudentCreateFields studentCreateFields = StudentCreateFields(
        studentDocuments: documentTypes, degrees: degrees, nations: nations);

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
}
