import 'dart:io';
import 'package:applycamp/domain/entity/student_create_params.dart';

abstract class StudentRepository {
  Future getAllMyStudents();
  Future getStudentById(int studentId);
  Future getStudentCreateFields();
  Future deleteStudent(int studentId);
  Future uploadStudentPhoto(File image);
  Future uploadStudentDocument(File document, int documentTypeId);
  Future createStudent(StudentCreateParams studentCreateParams);
}
