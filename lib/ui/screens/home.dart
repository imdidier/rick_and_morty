import 'package:flutter/material.dart';

import '../views/views.dart';
import '../widgets/custom_buttom_navidator.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';
  final int viewIndex;

  const HomeScreen({super.key, required this.viewIndex});

  final List<Widget> viewRoutes = const [
    CharacterView(),
    LocationView(),
    EpisodeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: viewIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigator(
        currentIndex: viewIndex,
      ),
    );
  }
}
