class ApplicationCreateFields {
  ApplicationCreateFields({
    required this.countryId,
    required this.schoolTypeId,
    required this.schoolId,
    required this.languageId,
    required this.degreeId,
    required this.programId,
    required this.note,
    required this.externalId,
    required this.semesterId,
  });
  late final int countryId;
  late final int schoolTypeId;
  late final int schoolId;
  late final int languageId;
  late final int degreeId;
  late final int programId;
  late final String note;
  late final String externalId;
  late final String semesterId;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['countryId'] = countryId;
    _data['schoolTypeId'] = schoolTypeId;
    _data['schoolId'] = schoolId;
    _data['languageId'] = languageId;
    _data['degreeId'] = degreeId;
    _data['programId'] = programId;
    _data['note'] = note;
    _data['externalId'] = externalId;
    _data['semesterId'] = semesterId;
    return _data;
  }
}
