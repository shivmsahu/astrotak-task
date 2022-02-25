import 'package:task_app/common/result_model.dart';
import 'package:task_app/resources/strings.dart';
import 'package:task_app/utils/network_helper.dart';

class AskQuestionController {
  static Future<ResultModel> getCategoryList() async {
    var res = await NetworkHelper.get(Apis.categoryEndpoint);
    if (res.statusCode != 200) {
      return ResultModel.failed(reason: StringBase.somethingWentWrong);
    }
    return ResultModel.success(data: res.body);
  }
}
