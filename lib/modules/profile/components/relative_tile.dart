import 'package:flutter/material.dart';
import 'package:task_app/resources/resources.dart';
import 'package:task_app/modules/profile/models/relative_list_response_model.dart';

class RelativeTile extends StatelessWidget {
  final AllRelatives relative;
  final Function onDelete;
  final Function onEdit;

  const RelativeTile(
      {Key? key,
      required this.relative,
      required this.onDelete,
      required this.onEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(
                relative.fullName ?? '-',
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  color: ColorBase.black,
                  fontWeight: FontWeight.w200,
                  fontSize: 12,
                ),
              )),
          Expanded(
              flex: 2,
              child: Text(
                '${relative.birthDetails?.dobDay}-${relative.birthDetails?.dobMonth}-${relative.birthDetails?.dobYear}',
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                    color: ColorBase.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 12),
              )),
          Expanded(
              flex: 1,
              child: Text(
                '${relative.birthDetails?.tobHour}:${relative.birthDetails?.tobMin}',
                style: const TextStyle(
                    color: ColorBase.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 12),
              )),
          Expanded(
              flex: 2,
              child: Text(
                relative.relation ?? '-',
                style: const TextStyle(
                    color: ColorBase.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 12),
              )),
          Expanded(
              child: IconButton(
            icon: const Icon(
              Icons.edit,
              color: ColorBase.primaryOrange,
            ),
            onPressed: () {
              onEdit.call();
            },
          )),
          Expanded(
              child: IconButton(
            icon: const Icon(
              Icons.delete,
              color: ColorBase.primaryOrange,
            ),
            onPressed: () {
              onDelete.call();
            },
          )),
        ],
      ),
    ));
  }
}
