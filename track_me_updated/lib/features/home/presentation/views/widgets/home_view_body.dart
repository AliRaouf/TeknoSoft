import 'package:flutter/material.dart';
import 'package:track_me_updated/features/home/presentation/views/widgets/main_feature_button_grid.dart';
import 'package:track_me_updated/features/home/presentation/views/widgets/workout_container.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome to your health journey!",
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Text("Start your day with a healthy breakfast",
              style: Theme.of(context).textTheme.bodySmall),
          const WorkoutContainer(),
          Text("Track your meals and exercises",
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(
            height: 32,
          ),
          const MainFeatureButtonGrid()
        ],
      ),
    );
  }
}
