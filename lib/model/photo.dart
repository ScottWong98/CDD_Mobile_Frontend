class Photo {
  int id;
  int petId;
  String photoValue;
  String description;
  DateTime createTime;

  Photo(
      {this.id,
      this.petId,
      this.photoValue,
      this.description,
      this.createTime});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    petId = json['petId'];
    photoValue = json['photoValue'];
    description = json['description'];
    createTime = DateTime.parse(json['createTime']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['petId'] = this.petId;
    data['photoValue'] = this.photoValue;
    data['description'] = this.description;
    data['createTime'] = this.createTime.toString();
    return data;
  }
}
