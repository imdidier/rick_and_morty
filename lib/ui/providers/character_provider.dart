import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/infrastructure/datasources/character_datasource_impl.dart';
import 'package:rick_and_morty/infrastructure/repositories/character_repository_impl.dart';

import '../../infrastructure/models/character.dart';

class CharacterProvider extends ChangeNotifier {
  final repository = CharacterRepositoryImpl(CharacterDatasourceImpl());
  Future<List<ResultCharacter>> getAllCharacters() async {
    return repository.getCharacters(page: 1);
  }
}
