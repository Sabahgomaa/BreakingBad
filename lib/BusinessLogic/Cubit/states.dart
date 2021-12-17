import 'package:breaking_bad/Data/model/Qoute.dart';
import 'package:breaking_bad/Data/model/characters.dart';

abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;

  CharactersLoaded(this.characters);
}

class QuotesLoaded extends CharactersState {
  final List<Quote> quotes;

  QuotesLoaded(this.quotes);
}
