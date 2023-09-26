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
