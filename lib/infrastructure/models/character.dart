import 'models.dart';

class Character {
  final Info info;
  final List<ResultCharacter> results;

  Character({
    required this.info,
    required this.results,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        info: Info.fromJson(json["info"]),
        results: List<ResultCharacter>.from(
            json["results"].map((result) => ResultCharacter.fromJson(result))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((result) => result.toJson())),
      };
}

class ResultCharacter {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Map<String, dynamic> origin;
  final Map<String, dynamic> location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  ResultCharacter({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory ResultCharacter.fromJson(Map<String, dynamic> json) =>
      ResultCharacter(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: (json["origin"]),
        location: (json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "origin": origin,
        "location": location,
        "image": image,
        "episode": List<String>.from(episode.map((episode) => episode)),
        "url": url,
        "created": created.toIso8601String(),
      };
}
