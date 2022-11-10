import 'dart:convert';
UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));
String userDataToJson(UserData data) => json.encode(data.toJson());
class UserData {
  UserData({
      Location? location, 
      String? id, 
      String? email, 
      String? password, 
      bool? isActive, 
      String? userType, 
      String? name, 
      String? dob, 
      String? addressLine1, 
      String? addressLine3, 
      String? city, 
      String? district, 
      String? state, 
      String? country, 
      String? pincode, 
      String? createdAt, 
      String? updatedAt, 
      int? v,}){
    _location = location;
    _id = id;
    _email = email;
    _password = password;
    _isActive = isActive;
    _userType = userType;
    _name = name;
    _dob = dob;
    _addressLine1 = addressLine1;
    _addressLine3 = addressLine3;
    _city = city;
    _district = district;
    _state = state;
    _country = country;
    _pincode = pincode;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  UserData.fromJson(dynamic json) {
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _id = json['_id'];
    _email = json['email'];
    _password = json['password'];
    _isActive = json['isActive'];
    _userType = json['userType'];
    _name = json['name'];
    _dob = json['dob'];
    _addressLine1 = json['addressLine1'];
    _addressLine3 = json['addressLine3'];
    _city = json['city'];
    _district = json['district'];
    _state = json['state'];
    _country = json['country'];
    _pincode = json['pincode'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  Location? _location;
  String? _id;
  String? _email;
  String? _password;
  bool? _isActive;
  String? _userType;
  String? _name;
  String? _dob;
  String? _addressLine1;
  String? _addressLine3;
  String? _city;
  String? _district;
  String? _state;
  String? _country;
  String? _pincode;
  String? _createdAt;
  String? _updatedAt;
  int? _v;
UserData copyWith({  Location? location,
  String? id,
  String? email,
  String? password,
  bool? isActive,
  String? userType,
  String? name,
  String? dob,
  String? addressLine1,
  String? addressLine3,
  String? city,
  String? district,
  String? state,
  String? country,
  String? pincode,
  String? createdAt,
  String? updatedAt,
  int? v,
}) => UserData(  location: location ?? _location,
  id: id ?? _id,
  email: email ?? _email,
  password: password ?? _password,
  isActive: isActive ?? _isActive,
  userType: userType ?? _userType,
  name: name ?? _name,
  dob: dob ?? _dob,
  addressLine1: addressLine1 ?? _addressLine1,
  addressLine3: addressLine3 ?? _addressLine3,
  city: city ?? _city,
  district: district ?? _district,
  state: state ?? _state,
  country: country ?? _country,
  pincode: pincode ?? _pincode,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  Location? get location => _location;
  String? get id => _id;
  String? get email => _email;
  String? get password => _password;
  bool? get isActive => _isActive;
  String? get userType => _userType;
  String? get name => _name;
  String? get dob => _dob;
  String? get addressLine1 => _addressLine1;
  String? get addressLine3 => _addressLine3;
  String? get city => _city;
  String? get district => _district;
  String? get state => _state;
  String? get country => _country;
  String? get pincode => _pincode;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['_id'] = _id;
    map['email'] = _email;
    map['password'] = _password;
    map['isActive'] = _isActive;
    map['userType'] = _userType;
    map['name'] = _name;
    map['dob'] = _dob;
    map['addressLine1'] = _addressLine1;
    map['addressLine3'] = _addressLine3;
    map['city'] = _city;
    map['district'] = _district;
    map['state'] = _state;
    map['country'] = _country;
    map['pincode'] = _pincode;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());
class Location {
  Location({
      String? type, 
      List<double>? coordinates,}){
    _type = type;
    _coordinates = coordinates;
}

  Location.fromJson(dynamic json) {
    _type = json['type'];
    _coordinates = json['coordinates'] != null ? json['coordinates'].cast<double>() : [];
  }
  String? _type;
  List<double>? _coordinates;
Location copyWith({  String? type,
  List<double>? coordinates,
}) => Location(  type: type ?? _type,
  coordinates: coordinates ?? _coordinates,
);
  String? get type => _type;
  List<double>? get coordinates => _coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['coordinates'] = _coordinates;
    return map;
  }

}