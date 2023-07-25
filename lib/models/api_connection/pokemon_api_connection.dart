import 'package:app_pokedex_mvc/models/pokemon_model.dart';
import 'package:dio/dio.dart';

class PokemonAPI {
  final dio = Dio();

  Future<List<PokemonModel>> getPokemon() async {
    final response = await dio.get('http://104.131.18.84/pokemon/');

    final pokemonList = response.data['data'] as List;

    return pokemonList
        .map((json) => PokemonModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
