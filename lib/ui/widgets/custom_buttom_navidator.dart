import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigator extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigator({Key? key, required this.currentIndex})
      : super(key: key);

  void onItemTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) => onItemTap(context, value),
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Characters',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_city_outlined),
          label: 'Locations',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_outline_outlined),
          label: 'Episodes',
        ),
      ],
    );
  }
}
