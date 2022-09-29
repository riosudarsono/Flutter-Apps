import 'package:retrofit/retrofit.dart';
import 'package:flutter_test_1/data/model/characher/CharacterInfo.dart';
import 'package:flutter_test_1/data/model/characher/CharacterResponse.dart';
import 'package:flutter_test_1/data/remote/service/character_service.dart';

class CharacterRepository {
  final CharacterService _characterService;

  CharacterRepository(this._characterService);

  Future<HttpResponse<CharacterResponse>> getCharacters(
    int page,
    Map<String, String>? options,
  ) => _characterService.getCharacters(page, options);

  Future<HttpResponse<CharacterInfo>> getCharacter(int id) =>
      _characterService.getCharacter(id);
}
