import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/config/theme/theme.dart';
import 'package:rick_and_morty/infrastructure/models/character.dart';
import 'package:rick_and_morty/ui/providers/character_provider.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({
    super.key,
  });

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  late CharacterProvider characterProvider;
  List<ResultCharacter> characters = [];
  List<Widget> allItems = [];
  bool isfirstTime = true;

  @override
  void didChangeDependencies() async {
    characterProvider = context.watch<CharacterProvider>();
    setup();
    _scrollController.addListener(() async {
      if ((_scrollController.position.pixels + 500 >=
          _scrollController.position.maxScrollExtent)) {
        await characterProvider.loadNextPage();
      }
    });
    super.didChangeDependencies();
  }

  setup() {
    if (isfirstTime) {
      characterProvider.getAllCharacters();
      isfirstTime = false;
    }
    characters = characterProvider.listCharacters;
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      appBar: AppBar(title: const Text('Characters'), centerTitle: true),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: characters.length,
        itemBuilder: (context, index) {
          ResultCharacter character = characters[index];
          return FadeInRightBig(
            child: ListTile(
              autofocus: true,
              enableFeedback: true,
              onTap: () async {
                await characterProvider.getCharacterById(character.id);
                // ignore: use_build_context_synchronously
                context.go('/home/0/character/${character.id}');
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              leading: _Image(character: character),
              title: Text(
                character.name,
                style: styleText,
              ),
              subtitle: _ItemStatus(character: character),
            ),
          );
        },
      ),
    );
  }
}

class _ItemStatus extends StatelessWidget {
  const _ItemStatus({
    required this.character,
  });

  final ResultCharacter character;

  @override
  Widget build(BuildContext context) {
    return Text(
      character.status,
      style: TextStyle(
        color: character.status == 'Dead'
            ? Colors.red
            : character.status == 'Alive'
                ? Colors.green
                : AppTheme().getTheme().brightness.name == 'dark'
                    ? Colors.white
                    : Colors.black,
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    required this.character,
  });

  final ResultCharacter character;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        character.image,
        fit: BoxFit.cover,
        height: 200,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress != null) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/image-no-found.jpg'));
          }
          return FadeIn(child: child);
        },
      ),
    );
  }
}
