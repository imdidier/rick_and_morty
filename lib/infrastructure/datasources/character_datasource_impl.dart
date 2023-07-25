import 'package:rick_and_morty/domain/datasources/character_datasource.dart';
import 'package:rick_and_morty/domain/entities/character.dart';

class CharacterDatasourceImpl extends CharacterDatasource {
  @override
  Future<List<CharacterEntity>> getCharacterByEspecies(String especies) {
    // TODO: implement getCharacterByEspecies
    throw UnimplementedError();
  }

  @override
  Future<List<CharacterEntity>> getCharacterByGender(String gender) {
    // TODO: implement getCharacterByGender
    throw UnimplementedError();
  }

  @override
  Future<CharacterEntity> getCharacterById(int id) {
    // TODO: implement getCharacterById
    throw UnimplementedError();
  }

  @override
  Future<List<CharacterEntity>> getCharacterByStatus(String status) {
    // TODO: implement getCharacterByStatus
    throw UnimplementedError();
  }

  @override
  Future<List<CharacterEntity>> getCharacterByType(String type) {
    // TODO: implement getCharacterByType
    throw UnimplementedError();
  }

  @override
  Future<List<CharacterEntity>> getCharacters({int page = 1}) {
    // TODO: implement getCharacters
    throw UnimplementedError();
  }

  @override
  Future<List<CharacterEntity>> searchCharacter(String query) {
    // TODO: implement searchCharacter
    throw UnimplementedError();
  }
}
