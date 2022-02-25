import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_app/modules/ask_question/controllers/ask_question_controller.dart';
import 'package:task_app/modules/ask_question/models/category_model.dart';
import 'package:task_app/resources/strings.dart';

part 'ask_question_event.dart';

part 'ask_question_state.dart';

class AskQuestionBloc extends Bloc<AskQuestionEvent, AskQuestionState> {
  void getCategoryList() {
    add(GetCategoryListEvent());
  }

  AskQuestionBloc() : super(AskQuestionInitial()) {
    on<AskQuestionEvent>((event, emit) async {
      if (event is GetCategoryListEvent) {
        emit(AskQuestionLoadingState());
        try {
          var res = await AskQuestionController.getCategoryList();
          if (!res.success) {
            emit(const AskQuestionErrorState(
                message: StringBase.somethingWentWrong));
          } else {
            emit(AskQuestionLoadedState(
                categoryModel: CategoryModel.fromJson(jsonDecode(res.data))));
          }
        } catch (e) {
          emit(AskQuestionErrorState(message: e.toString()));
        }
      }
    });
  }
}
