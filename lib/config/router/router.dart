import 'package:go_router/go_router.dart';

import '../../ui/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:view',
      name: HomeScreen.name,
      builder: (context, state) {
        final viewIndex = state.pathParameters['view'] ?? '0';
        return HomeScreen(viewIndex: int.parse(viewIndex));
      },
      routes: [
        GoRoute(
          path: 'character/:id',
          name: DetailsCharacterScreen.name,
          builder: (context, state) {
            final String characterId = state.pathParameters['id'] ?? 'no-id';
            return DetailsCharacterScreen(characterId: int.parse(characterId));
          },
        ),
        GoRoute(
          path: 'location/:id',
          name: DetailsLocationScreen.name,
          builder: (context, state) {
            final String locationId = state.pathParameters['id'] ?? 'no-id';
            return DetailsLocationScreen(characterId: int.parse(locationId));
          },
        ),
        GoRoute(
          path: 'episode/:id',
          name: DetailsEpisodeScreen.name,
          builder: (context, state) {
            final String episodeId = state.pathParameters['id'] ?? 'no-id';
            return DetailsEpisodeScreen(characterId: int.parse(episodeId));
          },
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    )
  ],
);
