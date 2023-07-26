import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/infrastructure/datasources/character_datasource_impl.dart';
import 'package:rick_and_morty/infrastructure/repositories/character_repository_impl.dart';

import '../../infrastructure/models/models.dart';

class CharacterProvider extends ChangeNotifier {
  int currentPage = 1;
  bool isLoading = false;
  List<ResultCharacter> listCharacters = [];
  late ResultCharacter currentResultCharacter;
  final repository = CharacterRepositoryImpl(CharacterDatasourceImpl());
  Future<List<ResultCharacter>> getAllCharacters() async {
    listCharacters = await repository.getCharacters(page: 1);
    notifyListeners();
    return listCharacters;
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    List<ResultCharacter> characters =
        await repository.getCharacters(page: currentPage);
    listCharacters.addAll(characters);
    await Future.delayed(const Duration(milliseconds: 100));
    isLoading = false;
    notifyListeners();
  }

  getCharacterById(int characterId) async {
    currentResultCharacter = await repository.getCharacterById(characterId);
    notifyListeners();
  }
}
