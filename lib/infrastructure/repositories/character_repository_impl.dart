import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/infrastructure/datasources/character_datasource_impl.dart';

import '../../domain/repositories/character_repository.dart';
import '../models/models.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  final CharacterDatasourceImpl characterDatasourceImpl;
  CharacterRepositoryImpl(this.characterDatasourceImpl);

  @override
  Future<List<ResultCharacter>> getCharacterByEspecies(String especie) {
    return characterDatasourceImpl.getCharacterByEspecies(especie);
  }

  @override
  Future<List<ResultCharacter>> getCharacterByGender(String gender) {
    return characterDatasourceImpl.getCharacterByGender(gender);
  }

  @override
  Future<ResultCharacter> getCharacterById(int id) {
    return characterDatasourceImpl.getCharacterById(id);
  }

  @override
  Future<List<ResultCharacter>> getCharacterByStatus(String status) {
    return characterDatasourceImpl.getCharacterByStatus(status);
  }

  @override
  Future<List<ResultCharacter>> getCharacterByType(String type) {
    return characterDatasourceImpl.getCharacterByType(type);
  }

  @override
  Future<List<ResultCharacter>> getCharacters({int page = 1}) {
    return characterDatasourceImpl.getCharacters(page: page);
  }

  @override
  Future<List<ResultCharacter>> searchCharacter(String query) {
    return characterDatasourceImpl.searchCharacter(query);
  }
}
