import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/infrastructure/models/models.dart';
import 'package:rick_and_morty/ui/providers/episode_provider.dart';

class EpisodeView extends StatefulWidget {
  const EpisodeView({super.key});

  @override
  State<EpisodeView> createState() => _EpisodeViewState();
}

class _EpisodeViewState extends State<EpisodeView> {
  late EpisodeProvider episodeProvider;
  List<ResultEpisode> episodes = [];
  bool isfirstTime = true;

  @override
  void didChangeDependencies() async {
    episodeProvider = context.watch<EpisodeProvider>();
    setup();
    _scrollController.addListener(() async {
      if ((_scrollController.position.pixels + 500 >=
          _scrollController.position.maxScrollExtent)) {
        await episodeProvider.loadNextPage();
      }
    });
    super.didChangeDependencies();
  }

  setup() {
    if (isfirstTime) {
      episodeProvider.getAllEpisodes();
      isfirstTime = false;
    }
    episodes = episodeProvider.listEpisodes;
  }

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (episodes.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    final styleText = Theme.of(context).textTheme.titleMedium;

    return Scaffold(
      appBar: AppBar(title: const Text('Episodes'), centerTitle: true),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: episodes.length,
        itemBuilder: (context, index) {
          ResultEpisode episode = episodes[index];
          return FadeInRightBig(
            child: ListTile(
              autofocus: true,
              enableFeedback: true,
              onTap: () async {
                await episodeProvider.getEpisodeById(episode.id);
                //ignore: use_build_context_synchronously
                context.go('/home/0/episode/${episode.id}');
              },
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              title: Text(
                episode.name,
                style: styleText,
              ),
              subtitle: Text(episode.episode),
            ),
          );
        },
      ),
    );
  }
}
