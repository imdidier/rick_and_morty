import 'package:flutter/material.dart';

class EpisodeView extends StatelessWidget {
  const EpisodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Episodes'), centerTitle: true),
      body: const Center(
        child: Text('Episode View'),
      ),
    );
  }
}
