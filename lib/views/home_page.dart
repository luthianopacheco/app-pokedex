import 'package:app_pokedex_mvc/controllers/home_page_controller.dart';
import 'package:app_pokedex_mvc/models/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomePageController>().loadPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/pokeball.png',
            ),
            onPressed: null,
          )
        ],
      ),
      body: Consumer<HomePageController>(
        builder: (context, value, child) {
          if (value.pokemonList.isNotEmpty) {
            return _buildPokemonListView(value);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildPokemonListView(HomePageController value) {
    return ListView.builder(
      itemCount: value.pokemonList.length,
      itemBuilder: (context, index) {
        var pokemon = value.pokemonList[index];
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: _getImage(pokemon),
              title: Text(pokemon.name.toString()),
              trailing: Text(
                '#${pokemon.number}',
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              onTap: () => Navigator.of(context)
                  .pushNamed('/description', arguments: index)),
        );
      },
    );
  }

  Widget _getImage(PokemonModel pokemon) {
    try {
      return Image.network(
        pokemon.thumbnailImage.toString(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
