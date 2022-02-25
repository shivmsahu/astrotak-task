part of 'ask_question_bloc.dart';

abstract class AskQuestionState extends Equatable {
  const AskQuestionState();
}

class AskQuestionInitial extends AskQuestionState {
  @override
  List<Object> get props => [];
}

class AskQuestionLoadingState extends AskQuestionState {
  @override
  List<Object> get props => [];
}

class AskQuestionErrorState extends AskQuestionState {
  final String message;

  const AskQuestionErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class AskQuestionLoadedState extends AskQuestionState {
  final CategoryModel categoryModel;

  const AskQuestionLoadedState({required this.categoryModel});

  @override
  List<Object> get props => [categoryModel];
}
