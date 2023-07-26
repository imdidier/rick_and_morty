import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/infrastructure/models/episode.dart';

import '../../infrastructure/datasources/episode_datasource_impl.dart';
import '../../infrastructure/repositories/episode_repository_impl.dart';

class EpisodeProvider extends ChangeNotifier {
  int currentPage = 1;
  bool isLoading = false;
  List<ResultEpisode> listEpisodes = [];
  late ResultEpisode currentResultEpisode;
  final repository = EpisodeRepositoryImpl(EpisodeDatasourceImpl());
  Future<List<ResultEpisode>> getAllEpisodes() async {
    listEpisodes = await repository.getEpisodes(page: 1);
    notifyListeners();
    return listEpisodes;
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    List<ResultEpisode> episodes =
        await repository.getEpisodes(page: currentPage);
    listEpisodes = [...episodes];
    await Future.delayed(const Duration(milliseconds: 100));
    isLoading = false;
    notifyListeners();
  }

  getLocationById(int episodeId) async {
    currentResultEpisode = await repository.getEpisodeById(episodeId);
    notifyListeners();
  }
}
