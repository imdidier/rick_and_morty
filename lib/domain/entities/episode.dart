import 'entities.dart';

class EpisodeEntity {
  InfoEntity info;
  List<ResultEpisodeEntity> results;

  EpisodeEntity({
    required this.info,
    required this.results,
  });
}

class ResultEpisodeEntity {
  int id;
  String name;
  String type;
  String dimension;
  List<String> residents;
  String url;
  DateTime created;

  ResultEpisodeEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });
}
