import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:task_app/modules/ask_question/ask_question_provider.dart';
import 'package:task_app/modules/ask_question/bloc/ask_question_bloc.dart';
import 'package:task_app/modules/home/home_screen.dart';
import 'package:task_app/modules/profile/bloc/profile_bloc.dart';
import 'package:task_app/modules/profile/profile_provider.dart';
import 'package:task_app/modules/profile/profile_screen.dart';
import 'package:task_app/resources/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<AskQuestionBloc>(
          create: (BuildContext context) => AskQuestionBloc(),
        ),
        BlocProvider<ProfileBloc>(
          create: (BuildContext context) => ProfileBloc(),
        ),
        ChangeNotifierProvider(create: (_) => AskQuestionProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: Utils.mainAppNav,
        theme: ThemeData(
            fontFamily: 'Montserrat',
            scaffoldBackgroundColor: ColorBase.offWhite,
            primaryColor: ColorBase.primaryOrange),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          ProfileScreen.routeName: (context) => const ProfileScreen(),
        },
      ),
    );
  }
}
