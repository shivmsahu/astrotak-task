import 'package:flutter/material.dart';
import 'package:task_app/resources/resources.dart';

class CommonAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;

  const CommonAppBar({Key? key, this.leading, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: ColorBase.offWhite,
        centerTitle: true,
        elevation: 0,
        title: Image.asset(
          Images.icon,
          height: preferredSize.height,
        ),
        leading: leading,
        actions: actions);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
