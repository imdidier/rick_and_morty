import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/config/router/router.dart';
import 'package:rick_and_morty/ui/providers/character_provider.dart';
import 'package:rick_and_morty/ui/providers/episode_provider.dart';
import 'package:rick_and_morty/ui/providers/location_provider.dart';
import 'config/theme/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharacterProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => EpisodeProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
    );
  }
}
