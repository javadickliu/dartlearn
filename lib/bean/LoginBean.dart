class LoginBean {
  int _code;
  Data _data;
  String _retmsg;

  LoginBean({int code, Data data, String retmsg}) {
    this._code = code;
    this._data = data;
    this._retmsg = retmsg;
  }

  int get code => _code;
  set code(int code) => _code = code;
  Data get data => _data;
  set data(Data data) => _data = data;
  String get retmsg => _retmsg;
  set retmsg(String retmsg) => _retmsg = retmsg;

  LoginBean.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    _retmsg = json['retmsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    data['retmsg'] = this._retmsg;
    return data;
  }
}

class Data {
  String _uid;
  String _name;
  String _account;
  int _pwd;
  int _upgrade;
  String _token;
  int _clientType;
  List<Area> _area;
  String _areaid;
  int _utype;
  String _refreshTime;

  Data(
      {String uid,
        String name,
        String account,
        int pwd,
        int upgrade,
        String token,
        int clientType,
        List<Area> area,
        String areaid,
        int utype,
        String refreshTime}) {
    this._uid = uid;
    this._name = name;
    this._account = account;
    this._pwd = pwd;
    this._upgrade = upgrade;
    this._token = token;
    this._clientType = clientType;
    this._area = area;
    this._areaid = areaid;
    this._utype = utype;
    this._refreshTime = refreshTime;
  }

  String get uid => _uid;
  set uid(String uid) => _uid = uid;
  String get name => _name;
  set name(String name) => _name = name;
  String get account => _account;
  set account(String account) => _account = account;
  int get pwd => _pwd;
  set pwd(int pwd) => _pwd = pwd;
  int get upgrade => _upgrade;
  set upgrade(int upgrade) => _upgrade = upgrade;
  String get token => _token;
  set token(String token) => _token = token;
  int get clientType => _clientType;
  set clientType(int clientType) => _clientType = clientType;
  List<Area> get area => _area;
  set area(List<Area> area) => _area = area;
  String get areaid => _areaid;
  set areaid(String areaid) => _areaid = areaid;
  int get utype => _utype;
  set utype(int utype) => _utype = utype;
  String get refreshTime => _refreshTime;
  set refreshTime(String refreshTime) => _refreshTime = refreshTime;

  Data.fromJson(Map<String, dynamic> json) {
    _uid = json['uid'];
    _name = json['name'];
    _account = json['account'];
    _pwd = json['pwd'];
    _upgrade = json['upgrade'];
    _token = json['token'];
    _clientType = json['client_type'];
    if (json['area'] != null) {
      _area = new List<Area>();
      json['area'].forEach((v) {
        _area.add(new Area.fromJson(v));
      });
    }
    _areaid = json['areaid'];
    _utype = json['utype'];
    _refreshTime = json['refresh_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this._uid;
    data['name'] = this._name;
    data['account'] = this._account;
    data['pwd'] = this._pwd;
    data['upgrade'] = this._upgrade;
    data['token'] = this._token;
    data['client_type'] = this._clientType;
    if (this._area != null) {
      data['area'] = this._area.map((v) => v.toJson()).toList();
    }
    data['areaid'] = this._areaid;
    data['utype'] = this._utype;
    data['refresh_time'] = this._refreshTime;
    return data;
  }
}

class Area {
  String _id;
  String _name;

  Area({String id, String name}) {
    this._id = id;
    this._name = name;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;

  Area.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    return data;
  }
}