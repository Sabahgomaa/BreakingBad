import 'package:breaking_bad/BusinessLogic/Cubit/cubit.dart';
import 'package:breaking_bad/Data/model/characters.dart';
import 'package:breaking_bad/Presentation/Screens/Characters.dart';
import 'package:breaking_bad/consets/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Data/WebServices/character_web_services.dart';
import 'Data/repository/characters_repository.dart';
import 'Presentation/Screens/character_details.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    characterRepository = CharacterRepository(CharacterWebServices());
    charactersCubit = CharactersCubit(characterRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => charactersCubit,
            child: CharactersScreens(),
          ),
        );

      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      CharactersCubit(characterRepository),
                  child: CharacterDetailsScreen(
                    character: character,
                  ),
                ));
    }
  }
}
