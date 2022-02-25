class ResultModel {
  bool success;
  dynamic data;
  String? message;

  ResultModel.success({this.data}) : success = true;

  ResultModel.failed({String? reason})
      : success = false,
        message = reason;
}
