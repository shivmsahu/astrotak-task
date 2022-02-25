import 'package:flutter/material.dart';
import 'package:task_app/modules/ask_question/models/category_model.dart';
import 'package:task_app/resources/colors.dart';
import 'package:task_app/resources/strings.dart';

class QuestionSuggestionWidget extends StatelessWidget {
  final CategoryData categoryData;
  final Function(String) onSelection;

  const QuestionSuggestionWidget(
      {Key? key, required this.categoryData, required this.onSelection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        const Text(
          StringBase.ideasToAsk,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorBase.black,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categoryData.suggestions?.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  onSelection.call(categoryData.suggestions![index]);
                },
                child: SuggestionTile(
                  title: categoryData.suggestions![index],
                ),
              );
            })
      ],
    );
  }
}

class SuggestionTile extends StatelessWidget {
  final String title;

  const SuggestionTile({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Transform.rotate(
                    angle: 95,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                          color: ColorBase.primaryOrange,
                          boxShadow: kElevationToShadow[4]),
                    )),
                const Positioned(
                  top: 1,
                  left: 1,
                  child: Icon(
                    Icons.not_listed_location_outlined,
                    size: 14,
                    color: ColorBase.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: Text(
              title,
              style: const TextStyle(
                color: ColorBase.black,
                fontSize: 14,
              ),
            ))
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          color: ColorBase.black,
        ),
      ],
    );
  }
}
