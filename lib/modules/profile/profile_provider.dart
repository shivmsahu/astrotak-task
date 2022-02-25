import 'package:flutter/material.dart';
import 'package:task_app/modules/profile/models/relative_list_response_model.dart';

class ProfileProvider with ChangeNotifier {
  List<AllRelatives> relativeList = [];

  AllRelatives? updateProfileData;

  void notify() {
    notifyListeners();
  }
}