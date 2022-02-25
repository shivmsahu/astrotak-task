import 'package:flutter/material.dart';
import 'package:task_app/modules/profile/components/friends_and_family_widget.dart';
import 'package:task_app/resources/resources.dart';

class MyProfileWidget extends StatefulWidget {
  const MyProfileWidget({Key? key}) : super(key: key);

  @override
  _MyProfileWidgetState createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 1;

  @override
  void initState() {
    _tabController =
        TabController(length: 2, vsync: this, initialIndex: selectedIndex);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      _tabController.animateTo(0,
                          duration: const Duration(milliseconds: 200));
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: selectedIndex == 0
                              ? ColorBase.primaryOrange
                              : ColorBase.white),
                      child: Center(
                        child: Text(
                          StringBase.basicProfile,
                          style: TextStyle(
                            color: selectedIndex == 0
                                ? ColorBase.white
                                : ColorBase.black,
                            fontWeight: FontWeight.w200,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )),
              ),
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      _tabController.animateTo(1,
                          duration: const Duration(milliseconds: 200));
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: selectedIndex == 1
                              ? ColorBase.primaryOrange
                              : ColorBase.white),
                      child: Center(
                        child: Text(
                          StringBase.friendsAndFamilyProfile,
                          style: TextStyle(
                            color: selectedIndex == 1
                                ? ColorBase.white
                                : ColorBase.black,
                            fontWeight: FontWeight.w200,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: TabBarView(
          children: _tabViews,
          controller: _tabController,
        ))
      ],
    );
  }

  final _tabViews = [
    const Center(child: Text(StringBase.basicProfile)),
    const FriendsAndFamilyWidget(),
  ];
}
