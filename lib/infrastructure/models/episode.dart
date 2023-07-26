import 'models.dart';

class EpisodeModel {
  final InfoModel info;
  final List<ResultEpisode> results;

  EpisodeModel({
    required this.info,
    required this.results,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
        info: InfoModel.fromJson(json["info"]),
        results: List<ResultEpisode>.from(
            json["results"].map((result) => ResultEpisode.fromJson(result))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((result) => result.toJson())),
      };
}

class ResultEpisode {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final DateTime created;

  ResultEpisode({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  factory ResultEpisode.fromJson(Map<String, dynamic> json) => ResultEpisode(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        dimension: json["dimension"],
        residents: List<String>.from(json["residents"].map((result) => result)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "dimension": dimension,
        "residents": List<String>.from(residents.map((result) => result)),
        "url": url,
        "created": created.toIso8601String(),
      };
}
