class SemesterCan {
/*
{
  "switchStatus": true
} 
*/

  late final bool? switchStatus;

  SemesterCan({
    this.switchStatus,
  });
  SemesterCan.fromJson(Map<String, dynamic> json) {
    switchStatus = json['switchStatus'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['switchStatus'] = switchStatus;
    return data;
  }
}
