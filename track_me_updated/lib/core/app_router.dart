import 'package:go_router/go_router.dart';
import 'package:track_me_updated/features/home/presentation/views/home_view.dart';
import 'package:track_me_updated/features/settings/presentation/views/settings_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsView(),
      ),
    ],
  );
}
