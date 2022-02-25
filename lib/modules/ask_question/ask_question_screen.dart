import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:task_app/modules/ask_question/ask_question_provider.dart';
import 'package:task_app/modules/ask_question/bloc/ask_question_bloc.dart';
import 'package:task_app/modules/ask_question/components/ask_question_features.dart';
import 'package:task_app/modules/ask_question/components/category_dropdown.dart';
import 'package:task_app/modules/ask_question/components/question_price_tile.dart';
import 'package:task_app/modules/ask_question/components/question_suggestions_widget.dart';
import 'package:task_app/modules/ask_question/components/wallet_balance_tile.dart';
import 'package:task_app/resources/colors.dart';
import 'package:task_app/resources/strings.dart';

class AskQuestionScreen extends StatefulWidget {
  const AskQuestionScreen({Key? key}) : super(key: key);

  @override
  _AskQuestionScreenState createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends State<AskQuestionScreen> {
  late TextEditingController questionController;
  late AskQuestionBloc _askQuestionBloc;

  @override
  void initState() {
    _askQuestionBloc = BlocProvider.of<AskQuestionBloc>(context);
    _askQuestionBloc.getCategoryList();
    _askQuestionBloc.stream.listen((state) {
      if (state is AskQuestionLoadedState) {
        AskQuestionProvider _askQuestionProvider =
            Provider.of<AskQuestionProvider>(context, listen: false);
        _askQuestionProvider.categoryList = state.categoryModel.data!;
      } else if(state is AskQuestionErrorState){
        Fluttertoast.showToast(msg: StringBase.somethingWentWrong);
      }
    });
    questionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AskQuestionProvider _askQuestionProvider =
        Provider.of<AskQuestionProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WalletBalanceTile(
            balance: 67.456,
            onAddMoney: () {},
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      StringBase.askAQuestion,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorBase.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      StringBase.askQuestionDescription,
                      style: TextStyle(
                        color: ColorBase.black,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      StringBase.chooseCategory,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorBase.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BlocBuilder<AskQuestionBloc, AskQuestionState>(
                        builder: (_, state) {
                      if (state is AskQuestionLoadingState) {
                        return const Center(
                          child: LinearProgressIndicator(
                            minHeight: 35,
                          ),
                        );
                      }
                      return CategoryDropdown(
                        categoryList: _askQuestionProvider.categoryList,
                        onSelection: (category) {
                          _askQuestionProvider.selectedCategory = category;
                          _askQuestionProvider.notify();
                        },
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: questionController,
                      maxLines: 3,
                      maxLength: 150,
                      decoration: const InputDecoration(
                        hintText: StringBase.typeQuestionHere,
                        hintStyle: TextStyle(
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    if (_askQuestionProvider.selectedCategory != null &&
                        _askQuestionProvider
                            .selectedCategory!.suggestions!.isNotEmpty)
                      QuestionSuggestionWidget(
                        categoryData: _askQuestionProvider.selectedCategory!,
                        onSelection: (question) {
                          questionController.text = question;
                        },
                      ),
                    const Text(
                      StringBase.seekingAnswersMsg,
                      style: TextStyle(
                        color: ColorBase.black,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const AskQuestionFeatures(),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_askQuestionProvider.selectedCategory != null)
            QuestionPriceTile(
              onAskNow: () {
                questionController.clear();
              },
              category: _askQuestionProvider.selectedCategory!,
            ),
        ],
      ),
    );
  }
}
