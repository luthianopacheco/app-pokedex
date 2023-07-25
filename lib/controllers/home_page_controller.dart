import 'package:app_pokedex_mvc/models/api_connection/pokemon_api_connection.dart';
import 'package:app_pokedex_mvc/models/pokemon_model.dart';
import 'package:flutter/material.dart';

class HomePageController extends ChangeNotifier {
  final PokemonAPI _api;
  HomePageController(this._api);

  List<PokemonModel> pokemonList = [];

  Future<List<PokemonModel>> loadPokemon() async {
    pokemonList = await _api.getPokemon();
    notifyListeners();

    return pokemonList;
  }
}
