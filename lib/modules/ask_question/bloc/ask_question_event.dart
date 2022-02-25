part of 'ask_question_bloc.dart';

abstract class AskQuestionEvent extends Equatable {
  const AskQuestionEvent();
}

class GetCategoryListEvent extends AskQuestionEvent {
  @override
  List<Object?> get props => [];
}