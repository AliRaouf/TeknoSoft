import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/core/app_router.dart';
import 'package:track_me_updated/core/theme/themes.dart';
import 'package:track_me_updated/features/theme/data/bloc/theme/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()..setInitialTheme())
      ],
      child: BlocConsumer<ThemeCubit, ThemeState>(
        builder: (context, state) {
          ThemeMode themeMode;
          if (state is ThemeChange) {
            themeMode = state.themeData;
          } else {
            themeMode = ThemeMode.system;
          }
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
          );
        },
        listener: (BuildContext context, ThemeState state) {},
      ),
    );
  }
}
