import 'dart:io';

import 'package:applycamp/data/source/student_data_source.dart';
import 'package:applycamp/domain/repository/student_repository.dart';
import 'package:file_picker/file_picker.dart';

class StudentRepositoryImpl implements StudentRepository {
  final StudentDataSource dataSource;

  StudentRepositoryImpl(this.dataSource);

  @override
  Future getAllMyStudents() async {
    return dataSource.getAllMyStudents();
  }

  @override
  Future getStudentCreateFields() async {
    return dataSource.getStudentCreateFields();
  }

  @override
  Future getStudentById(int studentId) async {
    return dataSource.getStudentById(studentId);
  }

  @override
  Future deleteStudent(int studentId) async {
    return dataSource.deleteStudent(studentId);
  }

  @override
  Future uploadStudentPhoto(File image) async {
    return dataSource.uploadStudentPhoto(image);
  }

  @override
  Future uploadStudentDocument(File document, int documentTypeId) async {
    return dataSource.uploadStudentDocument(document, documentTypeId);
  }
}
