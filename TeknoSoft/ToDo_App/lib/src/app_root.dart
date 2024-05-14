import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/homescreen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.transparent)),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
