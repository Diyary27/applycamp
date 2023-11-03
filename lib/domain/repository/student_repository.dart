abstract class StudentRepository {
  Future getAllMyStudents();
  Future getStudentById(int studentId);
  Future getStudentCreateFields();
  Future deleteStudent(int studentId);
}
