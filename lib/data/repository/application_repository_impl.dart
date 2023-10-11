import 'package:applycamp/data/source/application_data_source.dart';
import 'package:applycamp/domain/repository/application_repository.dart';

class ApplicationRepositoryImpl implements ApplicationRepository {
  final ApplicationDataSource dataSource;

  ApplicationRepositoryImpl(this.dataSource);

  @override
  Future getApplicationsByStudent(int id) async {
    return dataSource.getApplicationsByStudent(id);
  }
}
