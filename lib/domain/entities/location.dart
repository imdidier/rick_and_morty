import 'entities.dart';

class ResultEntity {
  InfoEntity info;
  List<ResultLocationEntity> results;

  ResultEntity({
    required this.info,
    required this.results,
  });
}

class ResultLocationEntity {
  int id;
  String name;
  String type;
  String dimension;
  List<String> residents;
  String url;
  DateTime created;

  ResultLocationEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });
}
