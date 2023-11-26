import 'package:applycamp/data/model/application_models/application_create_fields.dart';

abstract class ApplicationRepository {
  Future createApplication(
      ApplicationCreateFields applicationCreateFields, int studentId);
  Future getMyApplications();
  Future getMyApplicationsByFilter(
      {int? studentId, int? schoolId, int? statusId});
  Future getAnApplication(int id);
  Future getCreateApplicationFields(int studentId);
  Future getAllStatus();
  Future editApplication({
    required int studentId,
    int? schoolId,
    int? programId,
    int? degreeId,
    String? externalId,
    int? semesterId,
  });
  Future proceedToNextStep(int Id);
}
