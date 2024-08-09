import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/core/styles.dart';
import 'package:track_me_updated/features/theme/data/bloc/theme/theme_cubit.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    var cubit = ThemeCubit.get(context);
    return Scaffold(
      body: Center(
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            ThemeMode currentThemeMode;
            if (state is ThemeChange) {
              currentThemeMode = state.themeData;
            } else {
              currentThemeMode = ThemeMode.system;
            }
            return SegmentedButton(
              emptySelectionAllowed: false,
              showSelectedIcon: false,
              style: ButtonStyle(
                textStyle: MaterialStatePropertyAll(TextStyles.body16Dark),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return const Color(0xffFF9000);
                  } else {
                    return const Color(0xfffafafa);
                  }
                }),
              ),
              segments: const <ButtonSegment>[
                ButtonSegment(value: ThemeMode.light, label: Text('Light')),
                ButtonSegment(value: ThemeMode.dark, label: Text('Dark')),
                ButtonSegment(value: ThemeMode.system, label: Text('System')),
              ],
              selected: <ThemeMode>{currentThemeMode},
              onSelectionChanged: (Set newSelection) async {
                await cubit.changeTheme(themeMode: newSelection.first);
                setState(() {});
              },
            );
          },
        ),
      ),
    );
  }
}
