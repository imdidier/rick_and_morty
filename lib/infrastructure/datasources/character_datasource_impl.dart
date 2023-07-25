import 'package:dio/dio.dart';
import 'package:rick_and_morty/domain/datasources/character_datasource.dart';
import 'package:rick_and_morty/infrastructure/models/character.dart';

class CharacterDatasourceImpl extends CharacterDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api/',
    ),
  );

  List<ResultCharacter> _jsonToCharacter(Map<String, dynamic> json) {
    final CharacterModel characterresp = CharacterModel.fromJson(json);
    final List<ResultCharacter> characters = characterresp.results.toList();
    return characters;
  }

  @override
  Future<List<ResultCharacter>> getCharacterByEspecies(String especie) {
    // TODO: implement getCharacterByEspecies
    throw UnimplementedError();
  }

  @override
  Future<List<ResultCharacter>> getCharacterByGender(String gender) {
    // TODO: implement getCharacterByGender
    throw UnimplementedError();
  }

  @override
  Future<ResultCharacter> getCharacterById(int id) {
    // TODO: implement getCharacterById
    throw UnimplementedError();
  }

  @override
  Future<List<ResultCharacter>> getCharacterByStatus(String status) {
    // TODO: implement getCharacterByStatus
    throw UnimplementedError();
  }

  @override
  Future<List<ResultCharacter>> getCharacterByType(String type) {
    // TODO: implement getCharacterByType
    throw UnimplementedError();
  }

  @override
  Future<List<ResultCharacter>> getCharacters({int page = 1}) async {
    final response = await dio.get(
      'character',
    );
    return _jsonToCharacter(response.data);
  }

  @override
  Future<List<ResultCharacter>> searchCharacter(String query) {
    // TODO: implement searchCharacter
    throw UnimplementedError();
  }
}
