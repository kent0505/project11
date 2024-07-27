import 'package:go_router/go_router.dart';

import '../../features/home/pages/home_page.dart';
import '../../features/operation/pages/add_operation_page.dart';
import '../../features/operation/pages/edit_operation_page.dart';
import '../../features/settings/pages/my_profile_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/splash_page.dart';
import '../models/operation.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) => const AddOperationPage(),
    ),
    GoRoute(
      path: '/edit',
      builder: (context, state) => EditOperationPage(
        operation: state.extra as Operation,
      ),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const MyProfilePage(),
    ),
  ],
);
