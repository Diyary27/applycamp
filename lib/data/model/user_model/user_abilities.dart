class UserCan {
  UserCan({
    required this.update,
    required this.delete,
    required this.changeStatus,
  });
  late final bool update;
  late final bool delete;
  late final bool changeStatus;

  UserCan.fromJson(Map<String, dynamic> json) {
    update = json['update'];
    delete = json['delete'];
    changeStatus = json['changeStatus'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['update'] = update;
    _data['delete'] = delete;
    _data['changeStatus'] = changeStatus;
    return _data;
  }
}
