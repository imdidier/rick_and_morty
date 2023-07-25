import 'package:rick_and_morty/domain/entities/episode.dart';
import 'package:rick_and_morty/domain/repositories/episode_repository.dart';
import 'package:rick_and_morty/infrastructure/datasources/episode_datasource_impl.dart';

class EpisodeRepositoryImpl extends EpisodeRepository {
  final EpisodeDatasourceImpl episodeDatasourceImpl;
  EpisodeRepositoryImpl(this.episodeDatasourceImpl);

  @override
  Future<List<EpisodeEntity>> getEpisodeByEpisode(String episode) {
    return episodeDatasourceImpl.getEpisodeByEpisode(episode);
  }

  @override
  Future<EpisodeEntity> getEpisodeById(int id) {
    return episodeDatasourceImpl.getEpisodeById(id);
  }

  @override
  Future<List<EpisodeEntity>> getEpisodes({int page = 1}) {
    return episodeDatasourceImpl.getEpisodes(page: page);
  }

  @override
  Future<List<EpisodeEntity>> searchEpisode(String query) {
    return episodeDatasourceImpl.searchEpisode(query);
  }
}
