import 'package:applycamp/data/source/school_data_source.dart';
import 'package:applycamp/domain/repository/school_repository.dart';

class SchoolRepositoryImpl implements SchoolRepository {
  final SchoolDataSource dataSource;

  SchoolRepositoryImpl(this.dataSource);

  @override
  Future getSchoolById(int schoolId) async {
    return dataSource.getSchoolById(schoolId);
  }
}
