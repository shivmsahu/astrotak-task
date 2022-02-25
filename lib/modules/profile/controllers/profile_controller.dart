import 'dart:convert';

import 'package:task_app/common/result_model.dart';
import 'package:task_app/modules/profile/models/add_relative_request_model.dart';
import 'package:task_app/modules/profile/models/location_response_model.dart';
import 'package:task_app/modules/profile/models/update_relative_request_model.dart';
import 'package:task_app/resources/strings.dart';
import 'package:task_app/utils/network_helper.dart';

class ProfileController {
  static Future<ResultModel> getRelativeList() async {
    var res =
        await NetworkHelper.get(Apis.relativeListEndpoint, authCall: true);
    if (res.statusCode != 200) {
      return ResultModel.failed(reason: StringBase.somethingWentWrong);
    }
    return ResultModel.success(data: res.body);
  }

  static Future<ResultModel> addRelativeProfile(
      {required AddRelativeRequestModel relativeData}) async {
    var res = await NetworkHelper.post(
        Apis.addRelativeEndpoint, jsonEncode(relativeData.toJson()),
        authCall: true);
    if (res.statusCode != 200) {
      return ResultModel.failed(reason: StringBase.somethingWentWrong);
    }
    return ResultModel.success(data: res.body);
  }

  static Future<ResultModel> updateRelativeProfile(
      {required UpdateRelativeRequestModel relativeData}) async {
    var res = await NetworkHelper.post(
        Apis.updateRelativeEndpoint + relativeData.uuid!,
        jsonEncode(relativeData.toJson()),
        authCall: true);
    if (res.statusCode != 200) {
      return ResultModel.failed(reason: StringBase.somethingWentWrong);
    }
    return ResultModel.success(data: res.body);
  }

  static Future<ResultModel> deleteRelativeProfile(
      {required String uuid}) async {
    var res = await NetworkHelper.post(Apis.deleteRelativeEndpoint + uuid, '',
        authCall: true);
    if (res.statusCode != 200) {
      return ResultModel.failed(reason: StringBase.somethingWentWrong);
    }
    return ResultModel.success(data: res.body);
  }

  static Future<ResultModel> getLocationData({required String location}) async {
    var res = await NetworkHelper.get(
        Apis.locationEndpoint + "?inputPlace=$location");
    if (res.statusCode != 200) {
      return ResultModel.failed(reason: StringBase.somethingWentWrong);
    }
    return ResultModel.success(data: res.body);
  }

  static Future<List<LocationData>> getLocationList(
      {required String location}) async {
    var res = await NetworkHelper.get(
        Apis.locationEndpoint + "?inputPlace=$location");
    if (res.statusCode != 200) {
      return [];
    }
    var result = LocationResponseModel.fromJson(jsonDecode(res.body));
    return result.data ?? [];
  }
}
