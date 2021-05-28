class Intro {
  String _updatedAt;
  TeachInfo _teachInfo;
  String _createdAt;
  UserState _userState;
  ClassCount _classCount;
  ClassDetail _classDetail;
  String _objectId;

  Intro(
      {String updatedAt,
      TeachInfo teachInfo,
      String createdAt,
      UserState userState,
      ClassCount classCount,
      ClassDetail classDetail,
      String objectId}) {
    this._updatedAt = updatedAt;
    this._teachInfo = teachInfo;
    this._createdAt = createdAt;
    this._userState = userState;
    this._classCount = classCount;
    this._classDetail = classDetail;
    this._objectId = objectId;
  }

  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;
  TeachInfo get teachInfo => _teachInfo;
  set teachInfo(TeachInfo teachInfo) => _teachInfo = teachInfo;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  UserState get userState => _userState;
  set userState(UserState userState) => _userState = userState;
  ClassCount get classCount => _classCount;
  set classCount(ClassCount classCount) => _classCount = classCount;
  ClassDetail get classDetail => _classDetail;
  set classDetail(ClassDetail classDetail) => _classDetail = classDetail;
  String get objectId => _objectId;
  set objectId(String objectId) => _objectId = objectId;

  Intro.fromJson(Map<String, dynamic> json) {
    _updatedAt = json['updatedAt'];
    _teachInfo = json['teachInfo'] != null
        ? new TeachInfo.fromJson(json['teachInfo'])
        : null;
    _createdAt = json['createdAt'];
    _userState = json['userState'] != null
        ? new UserState.fromJson(json['userState'])
        : null;
    _classCount = json['classCount'] != null
        ? new ClassCount.fromJson(json['classCount'])
        : null;
    _classDetail = json['classDetail'] != null
        ? new ClassDetail.fromJson(json['classDetail'])
        : null;
    _objectId = json['objectId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updatedAt'] = this._updatedAt;
    if (this._teachInfo != null) {
      data['teachInfo'] = this._teachInfo.toJson();
    }
    data['createdAt'] = this._createdAt;
    if (this._userState != null) {
      data['userState'] = this._userState.toJson();
    }
    if (this._classCount != null) {
      data['classCount'] = this._classCount.toJson();
    }
    if (this._classDetail != null) {
      data['classDetail'] = this._classDetail.toJson();
    }
    data['objectId'] = this._objectId;
    return data;
  }
}

class TeachInfo {
  String _avatar;
  String _name;
  bool _follow;
  String _classImage;
  String _classHeaderImage;

  TeachInfo(
      {String avatar,
      String name,
      bool follow,
      String classImage,
      String classHeaderImage}) {
    this._avatar = avatar;
    this._name = name;
    this._follow = follow;
    this._classImage = classImage;
    this._classHeaderImage = classHeaderImage;
  }

  String get avatar => _avatar;
  set avatar(String avatar) => _avatar = avatar;
  String get name => _name;
  set name(String name) => _name = name;
  bool get follow => _follow;
  set follow(bool follow) => _follow = follow;
  String get classImage => _classImage;
  set classImage(String classImage) => _classImage = classImage;
  String get classHeaderImage => _classHeaderImage;
  set classHeaderImage(String classHeaderImage) =>
      _classHeaderImage = classHeaderImage;

  TeachInfo.fromJson(Map<String, dynamic> json) {
    _avatar = json['avatar'];
    _name = json['name'];
    _follow = json['follow'];
    _classImage = json['classImage'];
    _classHeaderImage = json['classHeaderImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this._avatar;
    data['name'] = this._name;
    data['follow'] = this._follow;
    data['classImage'] = this._classImage;
    data['classHeaderImage'] = this._classHeaderImage;
    return data;
  }
}

class UserState {
  String _vipLevel;
  String _price;
  String _level;
  String _comPrice;

  UserState({String vipLevel, String price, String level, String comPrice}) {
    this._vipLevel = vipLevel;
    this._price = price;
    this._level = level;
    this._comPrice = comPrice;
  }

  String get vipLevel => _vipLevel;
  set vipLevel(String vipLevel) => _vipLevel = vipLevel;
  String get price => _price;
  set price(String price) => _price = price;
  String get level => _level;
  set level(String level) => _level = level;
  String get comPrice => _comPrice;
  set comPrice(String comPrice) => _comPrice = comPrice;

  UserState.fromJson(Map<String, dynamic> json) {
    _vipLevel = json['vipLevel'];
    _price = json['price'];
    _level = json['level'];
    _comPrice = json['comPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vipLevel'] = this._vipLevel;
    data['price'] = this._price;
    data['level'] = this._level;
    data['comPrice'] = this._comPrice;
    return data;
  }
}

class ClassCount {
  String _listCount;
  String _playCount;
  String _c;

  ClassCount({String listCount, String playCount, String c}) {
    this._listCount = listCount;
    this._playCount = playCount;
    this._c = c;
  }

  String get listCount => _listCount;
  set listCount(String listCount) => _listCount = listCount;
  String get playCount => _playCount;
  set playCount(String playCount) => _playCount = playCount;
  String get c => _c;
  set c(String c) => _c = c;

  ClassCount.fromJson(Map<String, dynamic> json) {
    _listCount = json['listCount'];
    _playCount = json['playCount'];
    _c = json['c'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['listCount'] = this._listCount;
    data['playCount'] = this._playCount;
    data['c'] = this._c;
    return data;
  }
}

class ClassDetail {
  String _title;
  String _detail;

  ClassDetail({String title, String detail}) {
    this._title = title;
    this._detail = detail;
  }

  String get title => _title;
  set title(String title) => _title = title;
  String get detail => _detail;
  set detail(String detail) => _detail = detail;

  ClassDetail.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['detail'] = this._detail;
    return data;
  }
}
