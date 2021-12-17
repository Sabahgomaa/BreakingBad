import 'package:breaking_bad/Data/WebServices/character_web_services.dart';
import 'package:breaking_bad/Data/model/Qoute.dart';
import 'package:breaking_bad/Data/model/characters.dart';

class CharacterRepository {
  final CharacterWebServices characterWebServices;
  CharacterRepository(this.characterWebServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await characterWebServices.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }

  Future<List<Quote>> getCharacterQuotes(String charName) async {
    final quotes = await characterWebServices.getCharacterQuotes(charName);
    return quotes.map((charQuotes) => Quote.fromJson(charQuotes)).toList();
  }
}
