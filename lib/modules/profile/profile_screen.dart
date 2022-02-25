import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/common/common_appbar.dart';
import 'package:task_app/common/login_button.dart';
import 'package:task_app/modules/profile/bloc/profile_bloc.dart';
import 'package:task_app/modules/profile/components/my_profile_widget.dart';
import 'package:task_app/resources/resources.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = 'ProfileScreen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    BlocProvider.of<ProfileBloc>(context).getRelativeList();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              size: 30,
              color: ColorBase.primaryOrange,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [CommonOrangeButton(title: StringBase.logout, onTap: () {})],
        ),
        body: Column(
          children: [
            TabBar(
              tabs: _tabs,
              controller: _tabController,
              labelColor: ColorBase.primaryOrange,
              indicatorColor: ColorBase.primaryOrange,
              unselectedLabelColor: ColorBase.black,
            ),
            Expanded(
              child:
                  TabBarView(controller: _tabController, children: _tabViews),
            )
          ],
        ));
  }

  final _tabs = [
    const Tab(
      text: StringBase.myProfile,
    ),
    const Tab(
      text: StringBase.orderHistory,
    ),
  ];
  final _tabViews = [
    const MyProfileWidget(),
    const Center(child: Text(StringBase.orderHistory)),
  ];
}
