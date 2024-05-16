
import 'package:e_commerce/bloc/store/store_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login/login_cubit.dart';
import '../bloc/register/register_cubit.dart';
import '../bloc/user/user_cubit.dart';
import '../screens/start_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit(),),
        BlocProvider(create: (context) => UserCubit(),),
        BlocProvider(create: (context) => LoginCubit(),),
        BlocProvider(create: (context) => StoreCubit()..getItemStream(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, home: StartScreen(),
      ),
    );
  }
}
