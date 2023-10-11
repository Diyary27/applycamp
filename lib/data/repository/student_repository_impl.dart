import 'package:applycamp/data/source/student_data_source.dart';
import 'package:applycamp/domain/repository/student_repository.dart';

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
}
