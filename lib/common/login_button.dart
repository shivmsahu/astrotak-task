import 'package:flutter/material.dart';

import 'package:task_app/resources/colors.dart';

class CommonOrangeButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const CommonOrangeButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: ColorBase.primaryOrange)),
      child: Center(
          child: Text(
        title,
        style: const TextStyle(color: ColorBase.primaryOrange, fontSize: 10),
      )),
    );
  }
}
