import 'package:flutter/material.dart';
import 'package:task_app/modules/ask_question/models/category_model.dart';

class AskQuestionProvider with ChangeNotifier {
  List<CategoryData> categoryList = [];
  CategoryData? selectedCategory;
  void notify() {
    notifyListeners();
  }
}
