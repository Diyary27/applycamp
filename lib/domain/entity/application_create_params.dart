class ApplicationCreateParams {
  ApplicationCreateParams({
    this.countryId,
    this.schoolTypeId,
    required this.schoolId,
    this.languageId,
    required this.degreeId,
    required this.programId,
    this.note,
    this.externalId,
    required this.semesterId,
  });
  late final int? countryId;
  late final int? schoolTypeId;
  late final int schoolId;
  late final int? languageId;
  late final int degreeId;
  late final int programId;
  late final String? note;
  late final String? externalId;
  late final String semesterId;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    if (countryId != null) _data['countryId'] = countryId;
    if (schoolTypeId != null) _data['schoolTypeId'] = schoolTypeId;
    _data['schoolId'] = schoolId;
    if (languageId != null) _data['languageId'] = languageId;
    _data['degreeId'] = degreeId;
    _data['programId'] = programId;
    if (note != null && note != '') _data['note'] = note;
    if (externalId != null) _data['externalId'] = externalId;
    _data['semesterId'] = semesterId;
    return _data;
  }
}
