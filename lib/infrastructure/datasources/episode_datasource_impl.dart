import 'package:dio/dio.dart';
import 'package:rick_and_morty/domain/datasources/episode_datasource.dart';

import '../models/models.dart';

class EpisodeDatasourceImpl extends EpisodeDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api/',
    ),
  );

  List<ResultEpisode> _jsonToCharacter(Map<String, dynamic> json) {
    final EpisodeModel episodeResp = EpisodeModel.fromJson(json);
    final List<ResultEpisode> episodes = episodeResp.results.toList();
    return episodes;
  }

  @override
  Future<List<ResultEpisode>> getEpisodeByEpisode(String episode) {
    // TODO: implement getEpisodeByEpisode
    throw UnimplementedError();
  }

  @override
  Future<ResultEpisode> getEpisodeById(int id) async {
    final response = await dio.get(
      'episode/$id',
    );
    ResultEpisode episodeResp = ResultEpisode.fromJson(response.data);
    return episodeResp;
  }

  @override
  Future<List<ResultEpisode>> getEpisodes({int page = 1}) async {
    final response = await dio.get(
      'episode?page=$page',
    );
    return _jsonToCharacter(response.data);
  }

  @override
  Future<List<ResultEpisode>> searchEpisode(String query) {
    // TODO: implement searchEpisode
    throw UnimplementedError();
  }
}
