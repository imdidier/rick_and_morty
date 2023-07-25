import '../entities/entities.dart';

abstract class EpisodeRepository {
  Future<List<EpisodeEntity>> getEpisodes({int page = 1});
  Future<EpisodeEntity> getEpisodeById(int id);
  Future<List<EpisodeEntity>> getEpisodeByEpisode(String episode);
  Future<List<EpisodeEntity>> searchEpisode(String query);
}
