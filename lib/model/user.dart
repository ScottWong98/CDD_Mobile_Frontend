class User {
  int id;
  String account;
  String password;
  String nickName;
  int gender;
  String address;
  String avatar;
  String introduction;
  int petNumber;

  User(
      {this.id,
      this.account,
      this.password,
      this.nickName,
      this.gender,
      this.address,
      this.avatar,
      this.introduction,
      this.petNumber});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    account = json['account'];
    password = json['password'];
    nickName = json['nickName'];
    gender = json['gender'];
    address = json['address'];
    avatar = json['avatar'];
    introduction = json['introduction'];
    petNumber = json['petNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['account'] = this.account;
    data['password'] = this.password;
    data['nickName'] = this.nickName;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['avatar'] = this.avatar;
    data['introduction'] = this.introduction;
    data['petNumber'] = this.petNumber;
    return data;
  }
}
