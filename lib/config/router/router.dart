import 'package:go_router/go_router.dart';
import '../../ui/views/views.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CharacterView(),
    ),
    GoRoute(
      path: '/locations',
      builder: (context, state) => const LocationView(),
    ),
    GoRoute(
      path: '/episodes',
      builder: (context, state) => const EpisodeView(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) => const EpisodeView(),
    ),
  ],
);
