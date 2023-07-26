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
        // GoRoute(
        //   path: 'locations/:id',
        //   name: DetailsScreen.name,
        //   builder: (context, state) {
        //     final String characterId = state.pathParameters['id'] ?? 'no-id';
        //     return DetailsScreen(characterId: int.parse(characterId));
        //   },
        // ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    )
  ],
);
