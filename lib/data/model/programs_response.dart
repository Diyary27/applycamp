class ProgramsResponse {
  ProgramsResponse({
    required this.programs,
    required this.paginationInfo,
  });
  late final List<Programs> programs;
  late final PaginationInfo paginationInfo;

  ProgramsResponse.fromJson(Map<String, dynamic> json) {
    programs =
        List.from(json['programs']).map((e) => Programs.fromJson(e)).toList();
    paginationInfo = PaginationInfo.fromJson(json['paginationInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['programs'] = programs.map((e) => e.toJson()).toList();
    _data['paginationInfo'] = paginationInfo.toJson();
    return _data;
  }
}

class Programs {
  Programs({
    required this.speciality,
    required this.degree,
    required this.language,
    required this.id,
    required this.degreeId,
    required this.specialityId,
    required this.languageId,
    required this.title,
    required this.isActiveInSearch,
    required this.isActiveInNewApps,
    required this.hasArticle,
    required this.can,
    required this.createdAt,
    required this.updatedAt,
  });
  late final Speciality speciality;
  late final Degree degree;
  late final Language language;
  late final int id;
  late final int degreeId;
  late final int specialityId;
  late final int languageId;
  late final String title;
  late final bool isActiveInSearch;
  late final bool isActiveInNewApps;
  late final bool hasArticle;
  late final Can can;
  late final String createdAt;
  late final String updatedAt;

  Programs.fromJson(Map<String, dynamic> json) {
    speciality = Speciality.fromJson(json['speciality']);
    degree = Degree.fromJson(json['degree']);
    language = Language.fromJson(json['language']);
    id = json['id'];
    degreeId = json['degreeId'];
    specialityId = json['specialityId'];
    languageId = json['languageId'];
    title = json['title'];
    isActiveInSearch = json['isActiveInSearch'];
    isActiveInNewApps = json['isActiveInNewApps'];
    hasArticle = json['hasArticle'];
    can = Can.fromJson(json['can']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['speciality'] = speciality.toJson();
    _data['degree'] = degree.toJson();
    _data['language'] = language.toJson();
    _data['id'] = id;
    _data['degreeId'] = degreeId;
    _data['specialityId'] = specialityId;
    _data['languageId'] = languageId;
    _data['title'] = title;
    _data['isActiveInSearch'] = isActiveInSearch;
    _data['isActiveInNewApps'] = isActiveInNewApps;
    _data['hasArticle'] = hasArticle;
    _data['can'] = can.toJson();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}

class Speciality {
  Speciality({
    required this.field,
    required this.id,
    required this.title,
    required this.fieldId,
    required this.can,
  });
  late final Field field;
  late final int id;
  late final Title title;
  late final int fieldId;
  late final Can can;

  Speciality.fromJson(Map<String, dynamic> json) {
    field = Field.fromJson(json['field']);
    id = json['id'];
    title = Title.fromJson(json['title']);
    fieldId = json['fieldId'];
    can = Can.fromJson(json['can']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['field'] = field.toJson();
    _data['id'] = id;
    _data['title'] = title.toJson();
    _data['fieldId'] = fieldId;
    _data['can'] = can.toJson();
    return _data;
  }
}

class Field {
  Field({
    required this.id,
    required this.title,
    required this.can,
  });
  late final int id;
  late final Title title;
  late final Can can;

  Field.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = Title.fromJson(json['title']);
    can = Can.fromJson(json['can']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title.toJson();
    _data['can'] = can.toJson();
    return _data;
  }
}

class Title {
  Title({
    required this.fa,
    required this.en,
  });
  late final String fa;
  late final String en;

  Title.fromJson(Map<String, dynamic> json) {
    fa = json['fa'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fa'] = fa;
    _data['en'] = en;
    return _data;
  }
}

class Can {
  Can({
    required this.update,
    required this.delete,
  });
  late final bool update;
  late final bool delete;

  Can.fromJson(Map<String, dynamic> json) {
    update = json['update'];
    delete = json['delete'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['update'] = update;
    _data['delete'] = delete;
    return _data;
  }
}

class Degree {
  Degree({
    required this.id,
    required this.title,
    required this.order,
  });
  late final int id;
  late final Title title;
  late final int order;

  Degree.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = Title.fromJson(json['title']);
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title.toJson();
    _data['order'] = order;
    return _data;
  }
}

class Language {
  Language({
    required this.id,
    required this.title,
    required this.order,
    required this.can,
  });
  late final int id;
  late final String title;
  late final int order;
  late final Can can;

  Language.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    order = json['order'];
    can = Can.fromJson(json['can']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['order'] = order;
    _data['can'] = can.toJson();
    return _data;
  }
}

class PaginationInfo {
  PaginationInfo({
    required this.total,
    required this.count,
    required this.currentPage,
    required this.firstItem,
    required this.lastItem,
    required this.lastPage,
    required this.perPage,
  });
  late final int total;
  late final int count;
  late final int currentPage;
  late final int firstItem;
  late final int lastItem;
  late final int lastPage;
  late final int perPage;

  PaginationInfo.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    currentPage = json['currentPage'];
    firstItem = json['firstItem'];
    lastItem = json['lastItem'];
    lastPage = json['lastPage'];
    perPage = json['perPage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['count'] = count;
    _data['currentPage'] = currentPage;
    _data['firstItem'] = firstItem;
    _data['lastItem'] = lastItem;
    _data['lastPage'] = lastPage;
    _data['perPage'] = perPage;
    return _data;
  }
}
