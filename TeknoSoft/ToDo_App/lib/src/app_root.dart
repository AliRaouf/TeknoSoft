import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/sql/sql_cubit.dart';

import '../screens/homescreen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SqlCubit()..loadTasks(context),
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Colors.transparent)),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
