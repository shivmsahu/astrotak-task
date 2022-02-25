import 'package:flutter/material.dart';
import 'package:task_app/resources/colors.dart';
import 'package:task_app/resources/strings.dart';

class AskQuestionFeatures extends StatelessWidget {
  const AskQuestionFeatures({Key? key}) : super(key: key);

  static const List<String> _featureList = [
    StringBase.askFeature1,
    StringBase.askFeature2,
    StringBase.askFeature3,
    StringBase.askFeature4,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorBase.primaryOrange.withOpacity(0.2),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            for (String element in _featureList)
              Text(
                StringBase.bullet + element,
                style: const TextStyle(
                  color: ColorBase.primaryOrange,
                  fontSize: 12,
                ),
              )
          ],
        ));
  }
}
