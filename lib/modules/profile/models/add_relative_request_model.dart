/// birthDetails : {"dobDay":10,"dobMonth":8,"dobYear":1994,"tobHour":8,"tobMin":30,"meridiem":"AM"}
/// birthPlace : {"placeName":"Kulharia, Bihar, India","placeId":"ChIJwTa3v_6nkjkRC_b2yajUF_M"}
/// firstName : "Mohit"
/// lastName : "Kumar"
/// relationId : 3
/// gender : "MALE"

class AddRelativeRequestModel {
  AddRelativeRequestModel({
      BirthDetails? birthDetails, 
      BirthPlace? birthPlace, 
      String? firstName, 
      String? lastName, 
      int? relationId, 
      String? gender,}){
    _birthDetails = birthDetails;
    _birthPlace = birthPlace;
    _firstName = firstName;
    _lastName = lastName;
    _relationId = relationId;
    _gender = gender;
}

  AddRelativeRequestModel.fromJson(Map<String,dynamic> json) {
    _birthDetails = json['birthDetails'] != null ? BirthDetails.fromJson(json['birthDetails']) : null;
    _birthPlace = json['birthPlace'] != null ? BirthPlace.fromJson(json['birthPlace']) : null;
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _relationId = json['relationId'];
    _gender = json['gender'];
  }
  BirthDetails? _birthDetails;
  BirthPlace? _birthPlace;
  String? _firstName;
  String? _lastName;
  int? _relationId;
  String? _gender;

  BirthDetails? get birthDetails => _birthDetails;
  BirthPlace? get birthPlace => _birthPlace;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  int? get relationId => _relationId;
  String? get gender => _gender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_birthDetails != null) {
      map['birthDetails'] = _birthDetails?.toJson();
    }
    if (_birthPlace != null) {
      map['birthPlace'] = _birthPlace?.toJson();
    }
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['relationId'] = _relationId;
    map['gender'] = _gender;
    return map;
  }

}

/// placeName : "Kulharia, Bihar, India"
/// placeId : "ChIJwTa3v_6nkjkRC_b2yajUF_M"

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

/// dobDay : 10
/// dobMonth : 8
/// dobYear : 1994
/// tobHour : 8
/// tobMin : 30
/// meridiem : "AM"

class BirthDetails {
  BirthDetails({
      int? dobDay, 
      int? dobMonth, 
      int? dobYear, 
      int? tobHour, 
      int? tobMin, 
      String? meridiem,}){
    _dobDay = dobDay;
    _dobMonth = dobMonth;
    _dobYear = dobYear;
    _tobHour = tobHour;
    _tobMin = tobMin;
    _meridiem = meridiem;
}

  BirthDetails.fromJson(dynamic json) {
    _dobDay = json['dobDay'];
    _dobMonth = json['dobMonth'];
    _dobYear = json['dobYear'];
    _tobHour = json['tobHour'];
    _tobMin = json['tobMin'];
    _meridiem = json['meridiem'];
  }
  int? _dobDay;
  int? _dobMonth;
  int? _dobYear;
  int? _tobHour;
  int? _tobMin;
  String? _meridiem;

  int? get dobDay => _dobDay;
  int? get dobMonth => _dobMonth;
  int? get dobYear => _dobYear;
  int? get tobHour => _tobHour;
  int? get tobMin => _tobMin;
  String? get meridiem => _meridiem;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dobDay'] = _dobDay;
    map['dobMonth'] = _dobMonth;
    map['dobYear'] = _dobYear;
    map['tobHour'] = _tobHour;
    map['tobMin'] = _tobMin;
    map['meridiem'] = _meridiem;
    return map;
  }

}