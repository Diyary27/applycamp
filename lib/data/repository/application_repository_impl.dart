import 'package:applycamp/data/model/application_models/application_create_fields.dart';
import 'package:applycamp/data/source/application_data_source.dart';
import 'package:applycamp/domain/entity/application_create_params.dart';
import 'package:applycamp/domain/repository/application_repository.dart';

class ApplicationRepositoryImpl implements ApplicationRepository {
  final ApplicationDataSource dataSource;

  ApplicationRepositoryImpl(this.dataSource);

  @override
  Future getMyApplications() async {
    return dataSource.getMyApplications();
  }

  @override
  Future getAllStatus() async {
    return dataSource.getAllStatus();
  }

  @override
  Future getMyApplicationsByFilter(
      {int? studentId, int? schoolId, int? statusId}) async {
    return dataSource.getMyApplicationsByFilter(
        studentId: studentId, schoolId: schoolId, statusId: statusId);
  }

  @override
  Future getAnApplication(int id) async {
    return dataSource.getAnApplication(id);
  }

  @override
  Future getCreateApplicationFields(int studentId) async {
    return dataSource.getCreateApplicationFields(studentId);
  }

  @override
  Future editApplication(ApplicationCreateParams applicationCreateParams,
      int applicationId) async {
    return dataSource.editApplication(applicationCreateParams, applicationId);
  }

  @override
  Future proceedToNextStep(int Id) async => dataSource.proceedToNextStep(Id);

  @override
  Future createApplication(
      ApplicationCreateParams applicationCreateParams, int studentId) async {
    return dataSource.createApplication(applicationCreateParams, studentId);
  }
}
