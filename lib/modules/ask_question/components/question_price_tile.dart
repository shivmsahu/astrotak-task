import 'package:flutter/material.dart';

import 'package:task_app/modules/ask_question/models/category_model.dart';
import 'package:task_app/resources/colors.dart';
import 'package:task_app/resources/strings.dart';

class QuestionPriceTile extends StatelessWidget {
  final Function onAskNow;
  final CategoryData category;

  const QuestionPriceTile(
      {Key? key, required this.category, required this.onAskNow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: ColorBase.steelBlue, borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${StringBase.currencySymbol}${category.price?.toInt()} (${StringBase.oneQuestionOn} ${category.name})',
            style: const TextStyle(
              fontSize: 12,
              color: ColorBase.white,
              fontWeight: FontWeight.w200,
            ),
          ),
          GestureDetector(
            onTap: () {
              onAskNow.call();
            },
            child: Container(
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: ColorBase.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: ColorBase.black)),
              child: const Center(
                child: Text(
                  StringBase.askNow,
                  style: TextStyle(
                    fontSize: 12,
                    color: ColorBase.steelBlue,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
