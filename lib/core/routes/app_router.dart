import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../feature/splash/view/splash_screen.dart';
import '../../feature/landing/view/landing_screen.dart';
import 'routes_name.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigatorKey => _rootNavigatorKey;

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutesName.splashScreen,
    routes: [
      // Splash Screen
      GoRoute(
        path: RoutesName.splashScreen,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // Main Landing Screen
      GoRoute(
        path: RoutesName.homeScreen,
        name: 'home',
        builder: (context, state) => const LandingScreen(),
      ),

      // Individual Pages (for direct navigation)
      GoRoute(
        path: RoutesName.aboutScreen,
        name: 'about',
        builder: (context, state) => const LandingScreen(),
      ),

      GoRoute(
        path: RoutesName.projectsScreen,
        name: 'projects',
        builder: (context, state) => const LandingScreen(),
      ),

      GoRoute(
        path: RoutesName.experienceScreen,
        name: 'experience',
        builder: (context, state) => const LandingScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'The page you are looking for does not exist.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(RoutesName.homeScreen),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}
