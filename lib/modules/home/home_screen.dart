import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:task_app/common/common_appbar.dart';
import 'package:task_app/modules/ask_question/ask_question_provider.dart';
import 'package:task_app/modules/ask_question/ask_question_screen.dart';
import 'package:task_app/modules/ask_question/bloc/ask_question_bloc.dart';
import 'package:task_app/modules/profile/profile_screen.dart';
import 'package:task_app/resources/resources.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;
  late AskQuestionBloc _askQuestionBloc;

  @override
  void initState() {
    _askQuestionBloc = BlocProvider.of<AskQuestionBloc>(context);
    _askQuestionBloc.getCategoryList();
    _askQuestionBloc.stream.listen((state) {
      if (state is AskQuestionLoadedState) {
        AskQuestionProvider _askQuestionProvider =
            Provider.of<AskQuestionProvider>(context, listen: false);
        _askQuestionProvider.categoryList = state.categoryModel.data!;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _askQuestionBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBase.offWhite,
      appBar: CommonAppBar(
        leading: Image.asset(
          Images.hamburger,
          height: 30,
          width: 30,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProfileScreen.routeName);
            },
            child: Container(
                margin: const EdgeInsets.all(10),
                child: Image.asset(
                  Images.profile,
                  height: 30,
                  width: 30,
                )),
          )
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: _navBarItems,
        unselectedItemColor: ColorBase.grey,
        selectedItemColor: ColorBase.primaryOrange,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  final List<BottomNavigationBarItem> _navBarItems = [
    BottomNavigationBarItem(
        icon: Image.asset(
          Images.home,
          height: 25,
          color: ColorBase.grey,
        ),
        activeIcon: Image.asset(
          Images.home,
          height: 25,
          color: ColorBase.primaryOrange,
        ),
        label: StringBase.home),
    BottomNavigationBarItem(
        icon: Image.asset(
          Images.talk,
          height: 25,
          color: ColorBase.grey,
        ),
        activeIcon: Image.asset(
          Images.talk,
          height: 25,
          color: ColorBase.primaryOrange,
        ),
        label: StringBase.talk),
    BottomNavigationBarItem(
        icon: Image.asset(
          Images.ask,
          height: 25,
          color: ColorBase.grey,
        ),
        activeIcon: Image.asset(
          Images.ask,
          height: 25,
          color: ColorBase.primaryOrange,
        ),
        label: StringBase.askQuestion),
    BottomNavigationBarItem(
        icon: Image.asset(
          Images.reports,
          height: 25,
          color: ColorBase.grey,
        ),
        activeIcon: Image.asset(
          Images.reports,
          height: 25,
          color: ColorBase.primaryOrange,
        ),
        label: StringBase.reports),
    BottomNavigationBarItem(
        icon: Image.asset(
          Images.chat,
          height: 25,
          color: ColorBase.grey,
        ),
        activeIcon: Image.asset(
          Images.chat,
          height: 25,
          color: ColorBase.primaryOrange,
        ),
        label: StringBase.chat),
  ];

  static const List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text(
        StringBase.home,
      ),
    ),
    Center(
      child: Text(
        StringBase.talk,
      ),
    ),
    AskQuestionScreen(),
    Center(
      child: Text(
        StringBase.reports,
      ),
    ),
    Center(
      child: Text(
        StringBase.chat,
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
