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
  late final int? firstItem;
  late final int? lastItem;
  late final int lastPage;
  late final dynamic perPage;

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
    final data = <String, dynamic>{};
    data['total'] = total;
    data['count'] = count;
    data['currentPage'] = currentPage;
    data['firstItem'] = firstItem;
    data['lastItem'] = lastItem;
    data['lastPage'] = lastPage;
    data['perPage'] = perPage;
    return data;
  }
}
