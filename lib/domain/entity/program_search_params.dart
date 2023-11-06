class SearchParams {
  SearchParams({
    this.degreeIds,
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
    this.onlyUsedPrograms,
    this.keywords,
  });

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
  bool? onlyUsedPrograms;
  String? keywords;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (degreeIds != null && degreeIds != '') {
      data["q_degreeId[0]"] = degreeIds;
    }
    if (languageIds != null && languageIds != '') {
      data["q_languageId[0]"] = languageIds;
    }
    if (schoolTypeIds != null && schoolTypeIds != '') {
      data["q_schoolTypeId[0]"] = schoolTypeIds;
    }
    if (cityIds != null && cityIds != '') data["q_cityId[0]"] = cityIds;
    if (countryIds != null && countryIds != '') {
      data["q_countryId[0]"] = countryIds;
    }
    if (schoolIds != null && schoolIds != '') {
      data["q_schoolId[0]"] = schoolIds;
    }
    if (specialityIds != null && specialityIds != '') {
      data["q_specialityId[0]"] = specialityIds;
    }
    if (studyFieldIds != null && studyFieldIds != '') {
      data["q_studyFieldId[0]"] = studyFieldIds;
    }
    if (tuitionFeeHigh != null && tuitionFeeHigh != '') {
      data["q_tuitionFeeHigh"] = tuitionFeeHigh;
    }
    if (tuitionFeeLow != null && tuitionFeeLow != '') {
      data["q_tuitionFeeLow"] = tuitionFeeLow;
    }
    if (tuitionUnitId != null && tuitionUnitId != '') {
      data["q_tuitionUnitId[0]"] = tuitionUnitId;
    }
    if (keywords != null && keywords != '') data["q_keywords[0]"] = keywords;
    // here i hardcoded this variable because there is only one value it takes if it is selected
    if (onlyUsedPrograms != null && onlyUsedPrograms != '') {
      data["f_onlyUsed"] = 1;
    }
    return data;
  }
}
