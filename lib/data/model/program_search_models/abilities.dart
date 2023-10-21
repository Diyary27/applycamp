class Can {
  Can({
    required this.update,
    required this.delete,
  });
  late final bool? update;
  late final bool? delete;

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
