import 'package:applycamp/domain/entity/application_create_params.dart';

abstract class ApplicationRepository {
  Future createApplication(
      ApplicationCreateParams applicationCreateParams, int studentId);
  Future getMyApplications();
  Future getMyApplicationsByFilter(
      {int? studentId, int? schoolId, int? statusId});
  Future getAnApplication(int id);
  Future getCreateApplicationFields(int studentId);
  Future getAllStatus();
  Future editApplication(
      ApplicationCreateParams applicationCreateParams, int applicationId);
  Future proceedToNextStep(int Id);
}
