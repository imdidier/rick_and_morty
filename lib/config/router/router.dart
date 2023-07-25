import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/ui/screens/screens.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CharacterScreen(),
    ),
    GoRoute(
      path: '/locations',
      builder: (context, state) => const LocationScreen(),
    ),
    GoRoute(
      path: '/episodes',
      builder: (context, state) => const EpisodeScreen(),
    ),
  ],
);
