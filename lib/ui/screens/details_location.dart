import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/infrastructure/models/character.dart';
import 'package:rick_and_morty/ui/providers/location_provider.dart';

import '../../config/theme/theme.dart';
import '../../infrastructure/models/location.dart';
import '../providers/character_provider.dart';

class DetailsLocationScreen extends StatefulWidget {
  static const String name = 'details-location-screen';

  final int locationId;
  const DetailsLocationScreen({super.key, required this.locationId});

  @override
  State<DetailsLocationScreen> createState() => _DetailsLocationScreenState();
}

class _DetailsLocationScreenState extends State<DetailsLocationScreen> {
  late LocationProvider locationProvider;
  late CharacterProvider characterProvider;
  List<ResultCharacter> listResultCharacter = [];

  late ResultLocation location;
  bool isFristTime = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    locationProvider = context.watch<LocationProvider>();
    characterProvider = context.watch<CharacterProvider>();
    locationProvider.getLocationById(widget.locationId);
    location = locationProvider.currentResultLocation;
    if (isFristTime) {
      isFristTime = false;

      await Future.forEach(location.residents, (element) async {
        int characterId = int.parse(element.split('/').last);
        await characterProvider.getCharacterById(characterId);
        listResultCharacter.add(characterProvider.currentResultCharacter);
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Characters belonging to this location',
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.go('/home/1'),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: _Details(
        characters: listResultCharacter,
      ),
    );
  }
}

class _Details extends StatelessWidget {
  final List<ResultCharacter> characters;
  const _Details({required this.characters});

  @override
  Widget build(BuildContext context) {
    if (characters.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    final textStyle = Theme.of(context).textTheme.titleMedium;
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        ResultCharacter character = characters[index];
        return FadeInRightBig(
          child: ListTile(
            onTap: () async {
              // ignore: use_build_context_synchronously
              context.go('/home/0/character/${character.id}',
                  extra: 'locations');
            },
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            leading: _Image(character: character),
            title: Text(
              character.name,
              style: textStyle,
            ),
            subtitle: _ItemStatus(character: character),
          ),
        );
      },
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
