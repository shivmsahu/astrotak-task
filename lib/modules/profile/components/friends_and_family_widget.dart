import 'package:flutter/material.dart';
import 'package:task_app/modules/profile/components/add_relative_form.dart';
import 'package:task_app/modules/profile/components/relative_list.dart';
import 'package:task_app/modules/profile/components/update_relative_form.dart';
import 'package:task_app/utils/utils.dart';

class FriendsAndFamilyWidget extends StatefulWidget {
  const FriendsAndFamilyWidget({Key? key}) : super(key: key);

  @override
  _FriendsAndFamilyWidgetState createState() => _FriendsAndFamilyWidgetState();
}

class _FriendsAndFamilyWidgetState extends State<FriendsAndFamilyWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Navigator(
        key: Utils.profileNav,
        initialRoute: RelativeList.routeName,
        onGenerateRoute: (RouteSettings route) {
          Widget page;
          switch (route.name) {
            case RelativeList.routeName:
              page = const RelativeList();
              break;
            case AddRelativeForm.routeName:
              page = const AddRelativeForm();
              break;
            case UpdateRelativeForm.routeName:
              page = const UpdateRelativeForm();
              break;
            default:
              page = const RelativeList();
          }
          return PageRouteBuilder(
              pageBuilder: (_, __, ___) => page,
              transitionDuration: Duration.zero);
        },
      ),
    );
  }
}
