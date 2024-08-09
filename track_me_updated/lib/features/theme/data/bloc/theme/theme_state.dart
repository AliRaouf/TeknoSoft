part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

final class ThemeInitial extends ThemeState {}

final class ThemeChange extends ThemeState {
  final ThemeMode themeData;

  const ThemeChange({required this.themeData});
}
