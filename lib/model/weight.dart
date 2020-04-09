class Weight {
  int id;
  int petId;
  double weightValue;
  DateTime createTime;

  Weight({this.id, this.petId, this.weightValue, this.createTime});

  Weight.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    petId = json['petId'];
    weightValue = json['weightValue'];
    createTime = DateTime.parse(json['createTime']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['petId'] = this.petId;
    data['weightValue'] = this.weightValue;
    data['createTime'] = this.createTime.toString();
    return data;
  }
}
