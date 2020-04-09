class Diary {
  int id;
  int petId;
  String title;
  String content;
  DateTime createTime;
  DateTime updateTime;

  Diary(
      {this.id,
      this.petId,
      this.title,
      this.content,
      this.createTime,
      this.updateTime});

  Diary.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    petId = json['petId'];
    title = json['title'];
    content = json['content'];
    createTime = DateTime.parse(json['createTime']);
    updateTime = DateTime.parse(json['updateTime']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['petId'] = this.petId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['createTime'] = this.createTime.toString();
    data['updateTime'] = this.updateTime.toString();
    return data;
  }
}
