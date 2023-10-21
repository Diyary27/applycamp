import 'package:applycamp/data/source/application_data_source.dart';
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
}
