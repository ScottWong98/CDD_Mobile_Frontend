class Pet {
  int id;
  int userId;
  String nickName;
  int gender;
  String species;
  String avatar;
  String introduction;
  DateTime createTime;
  int diaryNumber;
  double weight;
  double totalCost;
  int photoNumber;

  Pet(
      {this.id = 0,
      this.userId,
      this.nickName,
      this.gender = 0,
      this.species,
      this.avatar,
      this.introduction,
      this.createTime,
      this.diaryNumber = 0,
      this.weight = 0.0,
      this.totalCost = 0,
      this.photoNumber = 0});

  Pet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    nickName = json['nickName'];
    gender = json['gender'];
    species = json['species'];
    avatar = json['avatar'];
    introduction = json['introduction'];
    createTime = DateTime.parse(json['createTime']);
    diaryNumber = json['diaryNumber'];
    weight = json['weight'];
    totalCost = json['totalCost'];
    photoNumber = json['photoNumber'];
  }

  // factory Pet.fromJson(Map<String, dynamic> json) => Pet(
  //       id: json['id'],
  //       userId: json['userId'],
  //       nickName: json['nickName'],
  //       gender: json['gender'],
  //       species: json['species'],
  //       avatar: json['avatar'],
  //       introduction: json['introduction'],
  //       createTime: json['createTime'],
  //       diaryNumber: json['diaryNumber'],
  //       weight: json['weight'],
  //       totalCost: json['totalCost'],
  //       photoNumber: json['photoNumber'],
  //     );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['nickName'] = this.nickName;
    data['gender'] = this.gender;
    data['species'] = this.species;
    data['avatar'] = this.avatar;
    data['introduction'] = this.introduction;
    data['createTime'] = this.createTime.toString();
    data['diaryNumber'] = this.diaryNumber;
    data['weight'] = this.weight;
    data['totalCost'] = this.totalCost;
    data['photoNumber'] = this.photoNumber;
    return data;
  }
}
