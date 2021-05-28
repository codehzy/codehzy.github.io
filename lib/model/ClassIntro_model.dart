class ClassIntroModel {
  String title;
  String detail;
  String listCount;
  String playCount;
  String avatar;
  String name;
  String follow;
  String classImage;
  String classHeaderImage;
  String vipLevel;
  String price;
  String level;
  String comPrice;

  ClassIntroModel(
      {this.title,
      this.detail,
      this.listCount,
      this.playCount,
      this.avatar,
      this.name,
      this.follow,
      this.classImage,
      this.classHeaderImage,
      this.vipLevel,
      this.price,
      this.level,
      this.comPrice});

  ClassIntroModel.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'];
    detail = json['detail'];
    listCount = json['listCount'];
    playCount = json['playCount'];
    avatar = json['avatar'];
    name = json['name'];
    follow = json['follow'];
    classImage = json['classImage'];
    classHeaderImage = json['classHeaderImage'];
    vipLevel = json['vipLevel'];
    price = json['price'];
    level = json['level'];
    comPrice = json['comPrice'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['detail'] = this.detail;
    data['listCount'] = this.listCount;
    data['playCount'] = this.playCount;
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['follow'] = this.follow;
    data['classImage'] = this.classImage;
    data['classHeaderImage'] = this.classHeaderImage;
    data['vipLevel'] = this.vipLevel;
    data['price'] = this.price;
    data['level'] = this.level;
    data['comPrice'] = this.comPrice;
    return data;
  }
}
