import '../../infrastructure/models/models.dart';

abstract class CharacterRepository {
  Future<List<ResultCharacter>> getCharacters({int page = 1});
  Future<ResultCharacter> getCharacterById(int id);
  Future<List<ResultCharacter>> getCharacterByStatus(String status);
  Future<List<ResultCharacter>> getCharacterByType(String type);
  Future<List<ResultCharacter>> getCharacterByGender(String gender);
  Future<List<ResultCharacter>> getCharacterByEspecies(String especie);
  Future<List<ResultCharacter>> searchCharacter(String query);
}
