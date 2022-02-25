/// uuid : "4f6869c0-f4ef-43c5-b726-4e4a00d3b278"
/// relation : "Brother"
/// relationId : 3
/// firstName : "Mohit"
/// middleName : null
/// lastName : "Singh"
/// fullName : "Mohit Kumar"
/// gender : "MALE"
/// dateAndTimeOfBirth : "1996-09-18 01:39"
/// birthDetails : {"dobYear":1996,"dobMonth":9,"dobDay":18,"tobHour":1,"tobMin":39,"meridiem":"AM"}
/// birthPlace : {"placeName":"Kulharia, Bihar, India","placeId":"ChIJSQWWoQ48kDkRg_d1ANRdMlo"}

class UpdateRelativeRequestModel {
  UpdateRelativeRequestModel({
      String? uuid, 
      String? relation, 
      int? relationId, 
      String? firstName, 
      dynamic middleName, 
      String? lastName, 
      String? fullName, 
      String? gender, 
      String? dateAndTimeOfBirth, 
      BirthDetails? birthDetails, 
      BirthPlace? birthPlace,}){
    _uuid = uuid;
    _relation = relation;
    _relationId = relationId;
    _firstName = firstName;
    _middleName = middleName;
    _lastName = lastName;
    _fullName = fullName;
    _gender = gender;
    _dateAndTimeOfBirth = dateAndTimeOfBirth;
    _birthDetails = birthDetails;
    _birthPlace = birthPlace;
}

  UpdateRelativeRequestModel.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _relation = json['relation'];
    _relationId = json['relationId'];
    _firstName = json['firstName'];
    _middleName = json['middleName'];
    _lastName = json['lastName'];
    _fullName = json['fullName'];
    _gender = json['gender'];
    _dateAndTimeOfBirth = json['dateAndTimeOfBirth'];
    _birthDetails = json['birthDetails'] != null ? BirthDetails.fromJson(json['birthDetails']) : null;
    _birthPlace = json['birthPlace'] != null ? BirthPlace.fromJson(json['birthPlace']) : null;
  }
  String? _uuid;
  String? _relation;
  int? _relationId;
  String? _firstName;
  dynamic _middleName;
  String? _lastName;
  String? _fullName;
  String? _gender;
  String? _dateAndTimeOfBirth;
  BirthDetails? _birthDetails;
  BirthPlace? _birthPlace;

  String? get uuid => _uuid;
  String? get relation => _relation;
  int? get relationId => _relationId;
  String? get firstName => _firstName;
  dynamic get middleName => _middleName;
  String? get lastName => _lastName;
  String? get fullName => _fullName;
  String? get gender => _gender;
  String? get dateAndTimeOfBirth => _dateAndTimeOfBirth;
  BirthDetails? get birthDetails => _birthDetails;
  BirthPlace? get birthPlace => _birthPlace;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['relation'] = _relation;
    map['relationId'] = _relationId;
    map['firstName'] = _firstName;
    map['middleName'] = _middleName;
    map['lastName'] = _lastName;
    map['fullName'] = _fullName;
    map['gender'] = _gender;
    map['dateAndTimeOfBirth'] = _dateAndTimeOfBirth;
    if (_birthDetails != null) {
      map['birthDetails'] = _birthDetails?.toJson();
    }
    if (_birthPlace != null) {
      map['birthPlace'] = _birthPlace?.toJson();
    }
    return map;
  }

}

/// placeName : "Kulharia, Bihar, India"
/// placeId : "ChIJSQWWoQ48kDkRg_d1ANRdMlo"

class BirthPlace {
  BirthPlace({
      String? placeName, 
      String? placeId,}){
    _placeName = placeName;
    _placeId = placeId;
}

  BirthPlace.fromJson(dynamic json) {
    _placeName = json['placeName'];
    _placeId = json['placeId'];
  }
  String? _placeName;
  String? _placeId;

  String? get placeName => _placeName;
  String? get placeId => _placeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['placeName'] = _placeName;
    map['placeId'] = _placeId;
    return map;
  }

}

/// dobYear : 1996
/// dobMonth : 9
/// dobDay : 18
/// tobHour : 1
/// tobMin : 39
/// meridiem : "AM"

class BirthDetails {
  BirthDetails({
      int? dobYear, 
      int? dobMonth, 
      int? dobDay, 
      int? tobHour, 
      int? tobMin, 
      String? meridiem,}){
    _dobYear = dobYear;
    _dobMonth = dobMonth;
    _dobDay = dobDay;
    _tobHour = tobHour;
    _tobMin = tobMin;
    _meridiem = meridiem;
}

  BirthDetails.fromJson(dynamic json) {
    _dobYear = json['dobYear'];
    _dobMonth = json['dobMonth'];
    _dobDay = json['dobDay'];
    _tobHour = json['tobHour'];
    _tobMin = json['tobMin'];
    _meridiem = json['meridiem'];
  }
  int? _dobYear;
  int? _dobMonth;
  int? _dobDay;
  int? _tobHour;
  int? _tobMin;
  String? _meridiem;

  int? get dobYear => _dobYear;
  int? get dobMonth => _dobMonth;
  int? get dobDay => _dobDay;
  int? get tobHour => _tobHour;
  int? get tobMin => _tobMin;
  String? get meridiem => _meridiem;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dobYear'] = _dobYear;
    map['dobMonth'] = _dobMonth;
    map['dobDay'] = _dobDay;
    map['tobHour'] = _tobHour;
    map['tobMin'] = _tobMin;
    map['meridiem'] = _meridiem;
    return map;
  }

}