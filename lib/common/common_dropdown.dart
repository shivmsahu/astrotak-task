import 'package:flutter/material.dart';

import 'package:task_app/resources/colors.dart';

class CommonDropdown extends StatefulWidget {
  final List<String> list;
  final Function(String) onSelection;

  const CommonDropdown(
      {Key? key, required this.list, required this.onSelection})
      : super(key: key);

  @override
  State<CommonDropdown> createState() => _CommonDropdownState();
}

class _CommonDropdownState extends State<CommonDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: ColorBase.black)),
      padding: const EdgeInsets.only(left: 10),
      child: DropdownButton<String>(
        underline: const SizedBox.shrink(),
        isExpanded: true,
        value: selectedValue,
        items: widget.list
            .map((value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
            .toList(),
        onChanged: (value) {
          widget.onSelection.call(value!);
          setState(() {
            selectedValue = value;
          });
        },
      ),
    );
  }
}
