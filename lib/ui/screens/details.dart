import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../infrastructure/models/models.dart';
import '../providers/character_provider.dart';

class DetailsCharacterScreen extends StatefulWidget {
  static const String name = 'details-screen';

  final int characterId;
  const DetailsCharacterScreen({super.key, required this.characterId});

  @override
  State<DetailsCharacterScreen> createState() => _DetailsCharacterScreenState();
}

class _DetailsCharacterScreenState extends State<DetailsCharacterScreen> {
  late CharacterProvider characterProvider;
  late ResultCharacter character;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    characterProvider = context.watch<CharacterProvider>();
    characterProvider.getCharacterById(widget.characterId);
    character = characterProvider.currentResultCharacter;
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppbar(
            character: character,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _Details(character: character),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _Details extends StatelessWidget {
  final ResultCharacter character;
  const _Details({required this.character});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  character.image,
                  fit: BoxFit.cover,
                  width: size.width * 0.3,
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: size.width * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name,
                      style: textStyle.titleLarge,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                    ),
                    Text(
                      'Gender: ${character.gender}',
                    ),
                    Text(
                      'Especie: ${character.species}',
                    ),
                    Text(
                      'Status: ${character.status}',
                      style: TextStyle(
                        color: character.status == 'Dead'
                            ? Colors.red
                            : character.status == 'Alive'
                                ? Colors.green
                                : Colors.black,
                      ),
                    ),
                    Text(
                      'Origin: ${character.origin['name']}',
                      maxLines: 1,
                    ),
                    Text(
                      'Created: ${character.created.toLocal().toString()}',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}

class _CustomSliverAppbar extends StatelessWidget {
  final ResultCharacter character;
  const _CustomSliverAppbar({required this.character});

  @override
  Widget build(
    BuildContext context,
  ) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black26,
      expandedHeight: size.height * 0.425,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                character.image,
                fit: BoxFit.contain,
              ),
            ),
            const _CustomGradient(
              colors: [
                Colors.black38,
                Colors.transparent,
              ],
              stops: [0.0, 0.3],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomGradient extends StatelessWidget {
  final List<double> stops;
  final Alignment begin;
  final Alignment end;
  final List<Color> colors;
  const _CustomGradient({
    required this.stops,
    required this.begin,
    required this.end,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: begin,
            stops: stops,
            end: end,
          ),
        ),
      ),
    );
  }
}
