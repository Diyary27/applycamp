abstract class ApplicationRepository {
  Future getMyApplications();
  Future getMyApplicationsByFilter(
      {int? studentId, int? schoolId, int? statusId});
  Future getAnApplication(int id);
  Future getAllStatus();
}
