import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/infrastructure/models/episode.dart';
import 'package:rick_and_morty/ui/providers/episode_provider.dart';

class DetailsEpisodeScreen extends StatefulWidget {
  static const String name = 'details-episode-screen';

  final int characterId;
  const DetailsEpisodeScreen({super.key, required this.characterId});

  @override
  State<DetailsEpisodeScreen> createState() => _DetailsEpisodeScreenState();
}

class _DetailsEpisodeScreenState extends State<DetailsEpisodeScreen> {
  late EpisodeProvider episodeProvider;
  late ResultEpisode episode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    episodeProvider = context.watch<EpisodeProvider>();
    episodeProvider.getLocationById(widget.characterId);
    episode = episodeProvider.currentResultEpisode;
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppbar(
            episode: episode,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _Details(episode: episode),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _Details extends StatelessWidget {
  final ResultEpisode episode;
  const _Details({required this.episode});

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
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(20),
              //   child: Image.network(
              //     location.image,
              //     fit: BoxFit.cover,
              //     width: size.width * 0.3,
              //   ),
              // ),
              const SizedBox(width: 15),
              SizedBox(
                width: size.width * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      episode.name,
                      style: textStyle.titleLarge,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                    ),
                    // Text(
                    //   'Gender: ${location.gender}',
                    // ),
                    // Text(
                    //   'Especie: ${character.species}',
                    // ),
                    // Text(
                    //   'Status: ${character.status}',
                    //   style: TextStyle(
                    //     color: character.status == 'Dead'
                    //         ? Colors.red
                    //         : character.status == 'Alive'
                    //             ? Colors.green
                    //             : Colors.black,
                    //   ),
                    // ),
                    // Text(
                    //   'Origin: ${character.origin['name']}',
                    //   maxLines: 1,
                    // ),
                    // Text(
                    //   'Created: ${character.created.toLocal().toString()}',
                    // ),
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
  final ResultEpisode episode;
  const _CustomSliverAppbar({required this.episode});

  @override
  Widget build(
    BuildContext context,
  ) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      leading: IconButton(
        onPressed: () => context.go('/home/2'),
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
      backgroundColor: Colors.black26,
      expandedHeight: size.height * 0.425,
      foregroundColor: Colors.white,
      flexibleSpace: const FlexibleSpaceBar(
        background: Stack(
          children: [
            // SizedBox.expand(
            //   child: Image.network(
            //     location.image,
            //     fit: BoxFit.contain,
            //   ),
            // ),
            _CustomGradient(
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