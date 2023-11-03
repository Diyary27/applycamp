import 'package:applycamp/data/model/program_search_models/degrees.dart';
import 'package:applycamp/data/model/student_model/nationality.dart';
import 'package:applycamp/data/model/student_model/student_document.dart';

class StudentCreateFields {
  final List<StudentDocument> studentDocuments;
  final List<Degree> degrees;
  final List<Nationality> nations;

  StudentCreateFields({
    required this.studentDocuments,
    required this.degrees,
    required this.nations,
  });
}
