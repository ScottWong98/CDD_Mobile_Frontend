class Cost {
  int id;
  int petId;
  String content;
  double costValue;
  DateTime createTime;

  Cost({this.id, this.petId, this.content, this.costValue, this.createTime});

  Cost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    petId = json['petId'];
    content = json['content'];
    costValue = json['costValue'];
    createTime = DateTime.parse(json['createTime']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['petId'] = this.petId;
    data['content'] = this.content;
    data['costValue'] = this.costValue;
    data['createTime'] = this.createTime.toString();
    return data;
  }
}
