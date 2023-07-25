import 'package:app_pokedex_mvc/models/api_connection/pokemon_api_connection.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final conexao = PokemonAPI();

  test('deve trazer uma lista de PokemonModel', () async {
    final list = await conexao.getPokemon();
    print(list[0].name);
  });
}
