/// httpStatus : "OK"
/// httpStatusCode : 200
/// success : true
/// message : "Places suggestions fetched successfully."
/// apiName : "Get places list."
/// data : [{"placeName":"Delhi, India","placeId":"ChIJL_P_CXMEDTkRw0ZdG-0GVvw"},{"placeName":"Delhi, NY, USA","placeId":"ChIJVS4Od-R43IkRReeLGEBFcv8"},{"placeName":"Delhi, ON, Canada","placeId":"ChIJf38LINc1LIgRjQCjD2EW78o"},{"placeName":"Delhi, CA, USA","placeId":"ChIJeWtf7IQOkYARqIGKfhVoSaU"},{"placeName":"Delhi, LA, USA","placeId":"ChIJcZQ-y7_dLoYROEhqDgVWSU0"}]

class LocationResponseModel {
  LocationResponseModel({
    String? httpStatus,
    int? httpStatusCode,
    bool? success,
    String? message,
    String? apiName,
    List<LocationData>? data,
  }) {
    _httpStatus = httpStatus;
    _httpStatusCode = httpStatusCode;
    _success = success;
    _message = message;
    _apiName = apiName;
    _data = data;
  }

  LocationResponseModel.fromJson(dynamic json) {
    _httpStatus = json['httpStatus'];
    _httpStatusCode = json['httpStatusCode'];
    _success = json['success'];
    _message = json['message'];
    _apiName = json['apiName'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(LocationData.fromJson(v));
      });
    }
  }

  String? _httpStatus;
  int? _httpStatusCode;
  bool? _success;
  String? _message;
  String? _apiName;
  List<LocationData>? _data;

  String? get httpStatus => _httpStatus;

  int? get httpStatusCode => _httpStatusCode;

  bool? get success => _success;

  String? get message => _message;

  String? get apiName => _apiName;

  List<LocationData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['httpStatus'] = _httpStatus;
    map['httpStatusCode'] = _httpStatusCode;
    map['success'] = _success;
    map['message'] = _message;
    map['apiName'] = _apiName;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// placeName : "Delhi, India"
/// placeId : "ChIJL_P_CXMEDTkRw0ZdG-0GVvw"

class LocationData {
  LocationData({
    String? placeName,
    String? placeId,
  }) {
    _placeName = placeName;
    _placeId = placeId;
  }

  LocationData.fromJson(dynamic json) {
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
