import '../../infrastructure/models/models.dart';

abstract class EpisodeDatasource {
  Future<List<ResultEpisode>> getEpisodes({int page = 1});
  Future<ResultEpisode> getEpisodeById(int id);
  Future<List<ResultEpisode>> getEpisodeByEpisode(String episode);
  Future<List<ResultEpisode>> searchEpisode(String query);
}
