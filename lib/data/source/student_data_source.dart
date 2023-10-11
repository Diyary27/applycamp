import 'package:applycamp/core/common/dio_consumer.dart';
import 'package:applycamp/core/constant/remote_constant.dart';
import 'package:applycamp/data/model/student_model/student_model.dart';

abstract class StudentDataSource {
  Future getAllMyStudents();
  Future getStudentCreateFields();
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
  Future getStudentCreateFields() {
    // TODO: implement getStudentCreateFields
    throw UnimplementedError();
  }
}
