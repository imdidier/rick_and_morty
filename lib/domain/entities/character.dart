import 'entities.dart';

class CharacterEntity {
  final InfoEntity info;
  final List<ResultCharacterEntity> results;

  CharacterEntity({
    required this.info,
    required this.results,
  });
}

class ResultCharacterEntity {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  ResultCharacterEntity({
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
}

class Location {
  final String name;
  final String url;

  Location({
    required this.name,
    required this.url,
  });
}
