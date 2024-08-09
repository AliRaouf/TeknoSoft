import 'package:flutter/material.dart';
import 'package:track_me_updated/core/styles.dart';

// Light Theme
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF7E57C2), // Medium Purple
    secondary: Color(0xFFFF4081), // Pink
    outline: Color(0xFF009688),
    surface: Color(0xFFFAFAFA), // Very light gray
    onPrimary: Color(0xFFFFFFFF), // Text color on primary
    onSecondary: Color(0xFFFFFFFF), // Text color on secondary
    onSurface: Color(0xFF212121), // Text color on surface
  ),
  scaffoldBackgroundColor: const Color(0xFFFAFAFA),
  textTheme: TextTheme(
      bodySmall: TextStyles.body16Light, // Dark Gray
      bodyMedium: TextStyles.body20Light, // Dark Gray
      titleMedium: TextStyles.title22Light, // Light Gray
      titleSmall: TextStyles.title18Light, // Light Gray
      titleLarge: TextStyles.title32Light),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF4081)), // Pink
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF7E57C2), // Medium Purple
    titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
  ),
);

// Dark Theme
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFBB86FC), // Light Purple
    secondary: Color(0xFF03DAC6), // Pink
    outline: Color(0xFFFF4081), // Pink
    surface: Color(0xFF121212), // Almost Black
    onPrimary: Color(0xFFFFFFFF), // Text color on primary
    onSecondary: Color(0xFFFFFFFF), // Text color on background
    onSurface: Color(0xFFFFFFFF), // Text color on surface
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),
  textTheme: TextTheme(
      bodyMedium: TextStyles.body20Dark,
      bodySmall: TextStyles.body16Dark,
      titleMedium: TextStyles.title22Dark, // Gray
      titleSmall: TextStyles.title18Dark, // Gray
      titleLarge: TextStyles.title32Dark),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xfffbb86fc)), // Pink
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFBB86FC), // Light Purple
    titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
  ),
);

// Specific Themes for Nutrition and Exercises
final ThemeData nutritionLightTheme = lightTheme.copyWith(
  colorScheme: lightTheme.colorScheme.copyWith(
    primary: const Color(0xFF009688), // Teal
  ),
);
final ThemeData nutritionLogLightTheme = lightTheme.copyWith(
  colorScheme: lightTheme.colorScheme.copyWith(
    primary: const Color(0xFFFE3947), // Light Red
  ),
);
final ThemeData healthyRecipesLightTheme = lightTheme.copyWith(
  colorScheme: lightTheme.colorScheme.copyWith(
    primary: const Color(0xFF3ACBBA), // Light Green
  ),
);
final ThemeData exercisesLibraryLightTheme = lightTheme.copyWith(
  colorScheme: lightTheme.colorScheme.copyWith(
    primary: const Color(0xFF4DA4DB), // Light Blue
  ),
);
final ThemeData workoutTrackerLightTheme = lightTheme.copyWith(
  colorScheme: lightTheme.colorScheme.copyWith(
    primary: const Color(0xFFCEA3FF), // Light Purple
  ),
);

final ThemeData exercisesLightTheme = lightTheme.copyWith(
  colorScheme: lightTheme.colorScheme.copyWith(
    primary: const Color(0xFF7E57C2), // Medium Purple
  ),
);

final ThemeData nutritionDarkTheme = darkTheme.copyWith(
  colorScheme: darkTheme.colorScheme.copyWith(
    primary: const Color(0xFF03DAC6), // Teal
  ),
);
final ThemeData nutritionLogDarkTheme = darkTheme.copyWith(
  colorScheme: darkTheme.colorScheme.copyWith(
    primary: const Color(0xFFA41E1E), // Teal
  ),
);
final ThemeData healthyRecipesDarkTheme = lightTheme.copyWith(
  colorScheme: lightTheme.colorScheme.copyWith(
    primary: const Color(0xFF106033), // Dark Green
  ),
);
final ThemeData exercisesLibraryDarkTheme = lightTheme.copyWith(
  colorScheme: lightTheme.colorScheme.copyWith(
    primary: const Color(0xFF1D3557), // Dark Blue
  ),
);
final ThemeData workoutTrackerDarkTheme = lightTheme.copyWith(
  colorScheme: lightTheme.colorScheme.copyWith(
    primary: const Color(0xFF461D82), // Dark Purple
  ),
);

final ThemeData exercisesDarkTheme = darkTheme.copyWith(
  colorScheme: darkTheme.colorScheme.copyWith(
    primary: const Color(0xFFBB86FC), // Light Purple
  ),
);
