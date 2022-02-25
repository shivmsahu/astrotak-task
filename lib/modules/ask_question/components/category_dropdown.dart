import 'package:flutter/material.dart';
import 'package:task_app/modules/ask_question/models/category_model.dart';

import 'package:task_app/resources/colors.dart';

class CategoryDropdown extends StatefulWidget {
  final List<CategoryData> categoryList;
  final Function(CategoryData) onSelection;

  const CategoryDropdown(
      {Key? key, required this.categoryList, required this.onSelection})
      : super(key: key);

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: ColorBase.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: kElevationToShadow[1],
      ),
      padding: const EdgeInsets.only(left: 10),
      child: DropdownButton<String>(
        underline: const SizedBox.shrink(),
        isExpanded: true,
        value: selectedValue,
        items: widget.categoryList
            .map((value) => DropdownMenuItem<String>(
                  value: value.name,
                  child: Text(value.name!),
                ))
            .toList(),
        onChanged: (value) {
          var selected = widget.categoryList
              .firstWhere((element) => element.name == value);
          widget.onSelection.call(selected);
          setState(() {
            selectedValue = value;
          });
        },
      ),
    );
  }
}
