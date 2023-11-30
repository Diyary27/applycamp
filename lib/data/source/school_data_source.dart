import 'package:applycamp/core/common/dio_consumer.dart';
import 'package:applycamp/core/constant/remote_constant.dart';
import 'package:applycamp/data/model/program_search_models/school.dart';

abstract class SchoolDataSource {
  Future getSchoolById(int schoolId);
}

class SchoolDataSourceImpl implements SchoolDataSource {
  final PortalDioConsumer dioConsumer;

  SchoolDataSourceImpl(this.dioConsumer);

  @override
  Future getSchoolById(int schoolId) async {
    final response = await dioConsumer
        .get(PortalRemoteConstants.getSchoolById + schoolId.toString());

    final school = School.fromJson(response.data["school"]);

    return school;
  }
}
