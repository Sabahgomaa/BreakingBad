import 'package:bloc/bloc.dart';
import 'package:breaking_bad/BusinessLogic/Cubit/states.dart';
import 'package:breaking_bad/Data/model/characters.dart';
import 'package:breaking_bad/Data/repository/characters_repository.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository characterRepository;
  List<Character> characters = [];
  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    characterRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }

  void getQuotes(String charName) {
    characterRepository.getCharacterQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }
}
