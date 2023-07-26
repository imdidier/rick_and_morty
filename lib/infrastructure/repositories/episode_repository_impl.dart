import 'package:rick_and_morty/domain/entities/episode.dart';
import 'package:rick_and_morty/domain/repositories/episode_repository.dart';
import 'package:rick_and_morty/infrastructure/datasources/episode_datasource_impl.dart';

import '../models/models.dart';

class EpisodeRepositoryImpl extends EpisodeRepository {
  final EpisodeDatasourceImpl episodeDatasourceImpl;
  EpisodeRepositoryImpl(this.episodeDatasourceImpl);

  @override
  Future<List<ResultEpisode>> getEpisodeByEpisode(String episode) {
    return episodeDatasourceImpl.getEpisodeByEpisode(episode);
  }

  @override
  Future<ResultEpisode> getEpisodeById(int id) {
    return episodeDatasourceImpl.getEpisodeById(id);
  }

  @override
  Future<List<ResultEpisode>> getEpisodes({int page = 1}) {
    return episodeDatasourceImpl.getEpisodes(page: page);
  }

  @override
  Future<List<ResultEpisode>> searchEpisode(String query) {
    return episodeDatasourceImpl.searchEpisode(query);
  }
}
