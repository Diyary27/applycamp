class ProgramSearchParams {
  ProgramSearchParams(
      {this.degreeIds,
      this.languageIds,
      this.schoolTypeIds,
      this.cityIds,
      this.countryIds,
      this.schoolIds,
      this.specialityIds,
      this.studyFieldIds,
      this.tuitionFeeHigh,
      this.tuitionFeeLow,
      this.tuitionUnitId,
      this.keywords});

  String? degreeIds;
  String? languageIds;
  String? schoolTypeIds;
  String? cityIds;
  String? countryIds;
  String? schoolIds;
  String? specialityIds;
  String? studyFieldIds;
  int? tuitionFeeHigh;
  int? tuitionFeeLow;
  int? tuitionUnitId;
  String? keywords;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    if (degreeIds != null && degreeIds != '')
      _data["q_degreeId[0]"] = degreeIds;
    if (languageIds != null && languageIds != '')
      _data["q_languageId[0]"] = languageIds;
    if (schoolTypeIds != null && schoolTypeIds != '')
      _data["q_schoolTypeId[0]"] = schoolTypeIds;
    if (cityIds != null && cityIds != '') _data["q_cityId[0]"] = cityIds;
    if (countryIds != null && countryIds != '')
      _data["q_countryId[0]"] = countryIds;
    if (schoolIds != null && schoolIds != '')
      _data["q_schoolId[0]"] = schoolIds;
    if (specialityIds != null && specialityIds != '')
      _data["q_specialityId[0]"] = specialityIds;
    if (studyFieldIds != null && studyFieldIds != '')
      _data["q_studyFieldId[0]"] = studyFieldIds;
    if (tuitionFeeHigh != null && tuitionFeeHigh != '')
      _data["q_tuitionFeeHigh"] = tuitionFeeHigh;
    if (tuitionFeeLow != null && tuitionFeeLow != '')
      _data["q_tuitionFeeLow"] = tuitionFeeLow;
    if (tuitionUnitId != null && tuitionUnitId != '')
      _data["q_tuitionUnitId[0]"] = tuitionUnitId;
    if (keywords != null && keywords != '') _data["q_keywords[0]"] = keywords;
    return _data;
  }
}
