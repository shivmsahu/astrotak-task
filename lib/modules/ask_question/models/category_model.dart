import 'dart:convert';

class CategoryModel {
  CategoryModel({
    String? httpStatus,
    int? httpStatusCode,
    bool? success,
    String? message,
    String? apiName,
    List<CategoryData>? data,
  }) {
    _httpStatus = httpStatus;
    _httpStatusCode = httpStatusCode;
    _success = success;
    _message = message;
    _apiName = apiName;
    _data = data;
  }

  CategoryModel.fromJson(dynamic json) {
    _httpStatus = json['httpStatus'];
    _httpStatusCode = json['httpStatusCode'];
    _success = json['success'];
    _message = json['message'];
    _apiName = json['apiName'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(CategoryData.fromJson(v));
      });
    }
  }

  String? _httpStatus;
  int? _httpStatusCode;
  bool? _success;
  String? _message;
  String? _apiName;
  List<CategoryData>? _data;

  String? get httpStatus => _httpStatus;

  int? get httpStatusCode => _httpStatusCode;

  bool? get success => _success;

  String? get message => _message;

  String? get apiName => _apiName;

  List<CategoryData>? get data => _data;

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

CategoryData dataFromJson(String str) => CategoryData.fromJson(json.decode(str));

String dataToJson(CategoryData data) => json.encode(data.toJson());

class CategoryData {
  CategoryData({
    int? id,
    String? name,
    String? description,
    double? price,
    List<String>? suggestions,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _price = price;
    _suggestions = suggestions;
  }

  CategoryData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _suggestions =
        json['suggestions'] != null ? json['suggestions'].cast<String>() : [];
  }

  int? _id;
  String? _name;
  String? _description;
  double? _price;
  List<String>? _suggestions;

  int? get id => _id;

  String? get name => _name;

  String? get description => _description;

  double? get price => _price;

  List<String>? get suggestions => _suggestions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['price'] = _price;
    map['suggestions'] = _suggestions;
    return map;
  }
}
