import 'package:applycamp/core/common/dio_consumer.dart';
import 'package:applycamp/core/constant/remote_constant.dart';
import 'package:applycamp/data/model/application_models/application.dart';
import 'package:applycamp/data/model/application_models/application_create_fields.dart';
import 'package:applycamp/data/model/application_models/application_create_response.dart';
import 'package:applycamp/data/model/application_models/application_status.dart';

abstract class ApplicationDataSource {
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

class ApplicationDataSourceImpl implements ApplicationDataSource {
  final PortalDioConsumer dioConsumer;

  ApplicationDataSourceImpl(this.dioConsumer);

  @override
  Future getMyApplications() async {
    final response =
        await dioConsumer.get(PortalRemoteConstants.getMyApplications);

    final List<Application> applications = [];
    for (var element in (response.data["applications"] as List)) {
      applications.add(Application.fromJson(element));
    }

    return applications;
  }

  @override
  Future getAllStatus() async {
    final response =
        await dioConsumer.get(PortalRemoteConstants.getAllApplicationStatus);

    final List<ApplicationStatus> status = [];
    for (var element in (response.data['applicationStatuses'] as List)) {
      status.add(ApplicationStatus.fromJson(element));
    }

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
    for (var element in (response.data["applications"] as List)) {
      applications.add(Application.fromJson(element));
    }

    return applications;
  }

  @override
  Future getAnApplication(int id) async {
    final response = await dioConsumer
        .get(PortalRemoteConstants.getAnApplication + id.toString());

    final Application application =
        Application.fromJson(response.data["application"]);

    return application;
  }

  @override
  Future getCreateApplicationFields(int studentId) async {
    final response = await dioConsumer.get(
        PortalRemoteConstants.getCreateApplicationFields,
        queryParameters: {"studentId": studentId});

    final createFields = ApplicationCreateFields.fromJson(response.data);

    return createFields;
  }

  @override
  Future editApplication(
      {required int studentId,
      int? schoolId,
      int? programId,
      int? degreeId,
      String? externalId,
      int? semesterId}) {
    // TODO: implement editApplication
    throw UnimplementedError();
  }

  @override
  Future proceedToNextStep(int Id) async {
    final response = await dioConsumer.post(
        "${PortalRemoteConstants.getAnApplication}$Id/proceed-to-next-step",
        body: {
          "subject": "demo",
          "body": "",
        });
  }

  @override
  Future createApplication(
      ApplicationCreateFields applicationCreateFields, int studentId) async {
    final response = await dioConsumer
        .post(PortalRemoteConstants.createApplication + "studentId=$studentId");

    final ApplicationCreateResponse createResponse =
        ApplicationCreateResponse.fromJson(response.data);

    return createResponse;
  }
}
