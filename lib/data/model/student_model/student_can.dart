class StudentCan {
  StudentCan({
    required this.update,
    required this.delete,
    required this.changeMaker,
    required this.changeStatus,
  });
  late final bool update;
  late final bool delete;
  late final bool changeMaker;
  late final bool changeStatus;

  StudentCan.fromJson(Map<String, dynamic> json) {
    update = json['update'];
    delete = json['delete'];
    changeMaker = json['changeMaker'];
    changeStatus = json['changeStatus'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['update'] = update;
    data['delete'] = delete;
    data['changeMaker'] = changeMaker;
    data['changeStatus'] = changeStatus;
    return data;
  }
}
