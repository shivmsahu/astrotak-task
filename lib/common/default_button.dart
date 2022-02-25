import 'package:flutter/material.dart';
import 'package:task_app/resources/resources.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function onTap;

  const DefaultButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap.call();
        },
        child: Container(
          height: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: ColorBase.primaryOrange),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: ColorBase.white,
                fontWeight: FontWeight.w200,
                fontSize: 14,
              ),
            ),
          ),
        ));
  }
}
