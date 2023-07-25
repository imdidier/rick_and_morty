import 'package:rick_and_morty/domain/datasources/episode_datasource.dart';
import 'package:rick_and_morty/domain/entities/episode.dart';

class EpisodeDatasourceImpl extends EpisodeDatasource {
  @override
  Future<List<EpisodeEntity>> getEpisodeByEpisode(String episode) {
    // TODO: implement getEpisodeByEpisode
    throw UnimplementedError();
  }

  @override
  Future<EpisodeEntity> getEpisodeById(int id) {
    // TODO: implement getEpisodeById
    throw UnimplementedError();
  }

  @override
  Future<List<EpisodeEntity>> getEpisodes({int page = 1}) {
    // TODO: implement getEpisodes
    throw UnimplementedError();
  }

  @override
  Future<List<EpisodeEntity>> searchEpisode(String query) {
    // TODO: implement searchEpisode
    throw UnimplementedError();
  }
}
