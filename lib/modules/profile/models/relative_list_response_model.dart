/// httpStatus : "OK"
/// httpStatusCode : 200
/// success : true
/// message : "Successfully fetched relatives for user."
/// apiName : "Get all relatives by user."
/// data : {"pageNo":1,"numberOfElements":3,"pageSize":10,"totalElements":3,"totalPages":1,"allRelatives":[{"uuid":"b6eedb88-d52b-440c-8fdc-f3ae633598f3","relation":"Sister","relationId":4,"firstName":"Trisha","middleName":null,"lastName":" ","fullName":"Trisha  ","gender":"FEMALE","dateAndTimeOfBirth":"2000-03-19T08:10:00","birthDetails":{"dobYear":2000,"dobMonth":3,"dobDay":19,"tobHour":8,"tobMin":10,"meridiem":"AM"},"birthPlace":{"placeName":"Guadalajara, Jalisco, Mexico","placeId":"ChIJm9MvtYyxKIQRUFeGvwKTPdY"}},{"uuid":"6b294c72-406c-4c81-9a66-039e75d16bc5","relation":"Brother","relationId":3,"firstName":"Mohit","middleName":null,"lastName":"Kumar","fullName":"Mohit Kumar","gender":"MALE","dateAndTimeOfBirth":"1994-08-10T08:30:00","birthDetails":{"dobYear":1994,"dobMonth":8,"dobDay":10,"tobHour":8,"tobMin":30,"meridiem":"AM"},"birthPlace":{"placeName":"Kulharia, Bihar, India","placeId":"ChIJwTa3v_6nkjkRC_b2yajUF_M"}},{"uuid":"ba0de377-e489-4e8a-8ad4-97033d878367","relation":"Brother","relationId":3,"firstName":"Mohit","middleName":null,"lastName":"Kumar","fullName":"Mohit Kumar","gender":"MALE","dateAndTimeOfBirth":"1994-08-10T08:30:00","birthDetails":{"dobYear":1994,"dobMonth":8,"dobDay":10,"tobHour":8,"tobMin":30,"meridiem":"AM"},"birthPlace":{"placeName":"Kulharia, Bihar, India","placeId":"ChIJwTa3v_6nkjkRC_b2yajUF_M"}}]}

class RelativeListResponseModel {
  RelativeListResponseModel({
    String? httpStatus,
    int? httpStatusCode,
    bool? success,
    String? message,
    String? apiName,
    RelativeData? data,
  }) {
    _httpStatus = httpStatus;
    _httpStatusCode = httpStatusCode;
    _success = success;
    _message = message;
    _apiName = apiName;
    _data = data;
  }

  RelativeListResponseModel.fromJson(dynamic json) {
    _httpStatus = json['httpStatus'];
    _httpStatusCode = json['httpStatusCode'];
    _success = json['success'];
    _message = json['message'];
    _apiName = json['apiName'];
    _data = json['data'] != null ? RelativeData.fromJson(json['data']) : null;
  }

  String? _httpStatus;
  int? _httpStatusCode;
  bool? _success;
  String? _message;
  String? _apiName;
  RelativeData? _data;

  String? get httpStatus => _httpStatus;

  int? get httpStatusCode => _httpStatusCode;

  bool? get success => _success;

  String? get message => _message;

  String? get apiName => _apiName;

  RelativeData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['httpStatus'] = _httpStatus;
    map['httpStatusCode'] = _httpStatusCode;
    map['success'] = _success;
    map['message'] = _message;
    map['apiName'] = _apiName;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// pageNo : 1
/// numberOfElements : 3
/// pageSize : 10
/// totalElements : 3
/// totalPages : 1
/// allRelatives : [{"uuid":"b6eedb88-d52b-440c-8fdc-f3ae633598f3","relation":"Sister","relationId":4,"firstName":"Trisha","middleName":null,"lastName":" ","fullName":"Trisha  ","gender":"FEMALE","dateAndTimeOfBirth":"2000-03-19T08:10:00","birthDetails":{"dobYear":2000,"dobMonth":3,"dobDay":19,"tobHour":8,"tobMin":10,"meridiem":"AM"},"birthPlace":{"placeName":"Guadalajara, Jalisco, Mexico","placeId":"ChIJm9MvtYyxKIQRUFeGvwKTPdY"}},{"uuid":"6b294c72-406c-4c81-9a66-039e75d16bc5","relation":"Brother","relationId":3,"firstName":"Mohit","middleName":null,"lastName":"Kumar","fullName":"Mohit Kumar","gender":"MALE","dateAndTimeOfBirth":"1994-08-10T08:30:00","birthDetails":{"dobYear":1994,"dobMonth":8,"dobDay":10,"tobHour":8,"tobMin":30,"meridiem":"AM"},"birthPlace":{"placeName":"Kulharia, Bihar, India","placeId":"ChIJwTa3v_6nkjkRC_b2yajUF_M"}},{"uuid":"ba0de377-e489-4e8a-8ad4-97033d878367","relation":"Brother","relationId":3,"firstName":"Mohit","middleName":null,"lastName":"Kumar","fullName":"Mohit Kumar","gender":"MALE","dateAndTimeOfBirth":"1994-08-10T08:30:00","birthDetails":{"dobYear":1994,"dobMonth":8,"dobDay":10,"tobHour":8,"tobMin":30,"meridiem":"AM"},"birthPlace":{"placeName":"Kulharia, Bihar, India","placeId":"ChIJwTa3v_6nkjkRC_b2yajUF_M"}}]

class RelativeData {
  RelativeData({
    int? pageNo,
    int? numberOfElements,
    int? pageSize,
    int? totalElements,
    int? totalPages,
    List<AllRelatives>? allRelatives,
  }) {
    _pageNo = pageNo;
    _numberOfElements = numberOfElements;
    _pageSize = pageSize;
    _totalElements = totalElements;
    _totalPages = totalPages;
    _allRelatives = allRelatives;
  }

  RelativeData.fromJson(dynamic json) {
    _pageNo = json['pageNo'];
    _numberOfElements = json['numberOfElements'];
    _pageSize = json['pageSize'];
    _totalElements = json['totalElements'];
    _totalPages = json['totalPages'];
    if (json['allRelatives'] != null) {
      _allRelatives = [];
      json['allRelatives'].forEach((v) {
        _allRelatives?.add(AllRelatives.fromJson(v));
      });
    }
  }

  int? _pageNo;
  int? _numberOfElements;
  int? _pageSize;
  int? _totalElements;
  int? _totalPages;
  List<AllRelatives>? _allRelatives;

  int? get pageNo => _pageNo;

  int? get numberOfElements => _numberOfElements;

  int? get pageSize => _pageSize;

  int? get totalElements => _totalElements;

  int? get totalPages => _totalPages;

  List<AllRelatives>? get allRelatives => _allRelatives;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pageNo'] = _pageNo;
    map['numberOfElements'] = _numberOfElements;
    map['pageSize'] = _pageSize;
    map['totalElements'] = _totalElements;
    map['totalPages'] = _totalPages;
    if (_allRelatives != null) {
      map['allRelatives'] = _allRelatives?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// uuid : "b6eedb88-d52b-440c-8fdc-f3ae633598f3"
/// relation : "Sister"
/// relationId : 4
/// firstName : "Trisha"
/// middleName : null
/// lastName : " "
/// fullName : "Trisha  "
/// gender : "FEMALE"
/// dateAndTimeOfBirth : "2000-03-19T08:10:00"
/// birthDetails : {"dobYear":2000,"dobMonth":3,"dobDay":19,"tobHour":8,"tobMin":10,"meridiem":"AM"}
/// birthPlace : {"placeName":"Guadalajara, Jalisco, Mexico","placeId":"ChIJm9MvtYyxKIQRUFeGvwKTPdY"}

class AllRelatives {
  AllRelatives({
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
    BirthPlace? birthPlace,
  }) {
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

  AllRelatives.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _relation = json['relation'];
    _relationId = json['relationId'];
    _firstName = json['firstName'];
    _middleName = json['middleName'];
    _lastName = json['lastName'];
    _fullName = json['fullName'];
    _gender = json['gender'];
    _dateAndTimeOfBirth = json['dateAndTimeOfBirth'];
    _birthDetails = json['birthDetails'] != null
        ? BirthDetails.fromJson(json['birthDetails'])
        : null;
    _birthPlace = json['birthPlace'] != null
        ? BirthPlace.fromJson(json['birthPlace'])
        : null;
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

/// placeName : "Guadalajara, Jalisco, Mexico"
/// placeId : "ChIJm9MvtYyxKIQRUFeGvwKTPdY"

class BirthPlace {
  BirthPlace({
    String? placeName,
    String? placeId,
  }) {
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

/// dobYear : 2000
/// dobMonth : 3
/// dobDay : 19
/// tobHour : 8
/// tobMin : 10
/// meridiem : "AM"

class BirthDetails {
  BirthDetails({
    int? dobYear,
    int? dobMonth,
    int? dobDay,
    int? tobHour,
    int? tobMin,
    String? meridiem,
  }) {
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
