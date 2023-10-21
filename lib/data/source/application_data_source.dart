import 'package:applycamp/core/common/dio_consumer.dart';
import 'package:applycamp/core/constant/remote_constant.dart';
import 'package:applycamp/data/model/application_models/application.dart';
import 'package:applycamp/data/model/application_models/application_status.dart';

abstract class ApplicationDataSource {
  Future getMyApplications();
  Future getMyApplicationsByFilter(
      {int? studentId, int? schoolId, int? statusId});
  Future getAnApplication(int id);

  Future getAllStatus();
}

class ApplicationDataSourceImpl implements ApplicationDataSource {
  final PortalDioConsumer dioConsumer;

  ApplicationDataSourceImpl(this.dioConsumer);

  @override
  Future getMyApplications() async {
    final response =
        await dioConsumer.get(PortalRemoteConstants.getMyApplications);

    final List<Application> applications = [];
    (response.data["applications"] as List).forEach((element) {
      applications.add(Application.fromJson(element));
    });

    return applications;
  }

  @override
  Future getAllStatus() async {
    final response =
        await dioConsumer.get(PortalRemoteConstants.getAllApplicationStatus);

    final List<ApplicationStatus> status = [];
    (response.data['applicationStatuses'] as List).forEach((element) {
      status.add(ApplicationStatus.fromJson(element));
    });

    return status;
  }

  @override
  Future getMyApplicationsByFilter(
      {int? studentId, int? schoolId, int? statusId}) async {
    final response = await dioConsumer.get(
      PortalRemoteConstants.getMyApplications,
      queryParameters: {
        if (studentId != null && studentId != '') "q_studentId[0]": studentId,
        if (schoolId != null && schoolId != '') "q_schoolId[0]": schoolId,
        if (statusId != null && statusId != '') "q_statusId[0]": statusId,
      },
    );

    final List<Application> applications = [];
    (response.data["applications"] as List).forEach((element) {
      applications.add(Application.fromJson(element));
    });

    return applications;
  }

  @override
  Future getAnApplication(int id) async {
    final response = await dioConsumer
        .get(PortalRemoteConstants.getAnApplication + id.toString());

    final Application application = Application.fromJson(response.data);

    return application;
  }
}
