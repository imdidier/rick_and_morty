import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/infrastructure/models/character.dart';
import 'package:rick_and_morty/ui/providers/character_provider.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({super.key});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  late CharacterProvider characterProvider;
  List<ResultCharacter> characters = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    characterProvider = context.watch<CharacterProvider>();
    setup();
  }

  setup() async {
    characters = await characterProvider.getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          ResultCharacter character = characters[index];
          return ListTile(
            title: Text(character.name),
          );
        },
      ),
    ));
  }
}
