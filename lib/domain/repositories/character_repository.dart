import '../entities/entities.dart';

abstract class CharacterRepository {
  Future<List<CharacterEntity>> getCharacters({int page = 1});
  Future<CharacterEntity> getCharacterById(int id);
  Future<List<CharacterEntity>> getCharacterByStatus(String status);
  Future<List<CharacterEntity>> getCharacterByType(String type);
  Future<List<CharacterEntity>> getCharacterByGender(String gender);
  Future<List<CharacterEntity>> getCharacterByEspecies(String especies);
  Future<List<CharacterEntity>> searchCharacter(String query);
}
