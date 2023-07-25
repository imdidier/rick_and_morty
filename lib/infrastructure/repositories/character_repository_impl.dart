import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/infrastructure/datasources/character_datasource_impl.dart';

import '../../domain/repositories/character_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  final CharacterDatasourceImpl characterDatasourceImpl;
  CharacterRepositoryImpl(this.characterDatasourceImpl);

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
