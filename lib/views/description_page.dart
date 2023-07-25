import 'package:app_pokedex_mvc/controllers/home_page_controller.dart';
import 'package:app_pokedex_mvc/models/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  void initState() {
    super.initState();
    context.read<HomePageController>().loadPokemon();
  }

  @override
  Widget build(BuildContext context) {
    final indexPokemon = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: _buildPokemonAppBar(indexPokemon),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/opened-pokeball.png'),
            onPressed: null,
          )
        ],
      ),
      body: Consumer<HomePageController>(
        builder: (context, value, child) {
          if (value.pokemonList.isNotEmpty) {
            return _buildCardPokemon(indexPokemon, value.pokemonList);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildPokemonAppBar(int indexPokemon) {
    return Consumer<HomePageController>(
      builder: (context, value, child) {
        if (value.pokemonList.isNotEmpty) {
          return Text('${value.pokemonList[indexPokemon].name}');
        } else {
          return const Text('');
        }
      },
    );
  }

  Widget _buildCardPokemon(int indexPokemon, List<PokemonModel> value) {
    var pokemon = value[indexPokemon];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 200,
                child: Card(
                  shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Colors.grey.shade200,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '#${pokemon.number}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Center(child: Image.network('${pokemon.thumbnailImage}')),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(pokemon.description.toString()),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(thickness: 1),
              ),
              const Text(
                'Tipo:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(pokemon.type!.join(', ')),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(thickness: 1),
              ),
              const Text(
                'Fraquezas:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(pokemon.weakness!.join(', ')),
            ],
          ),
        ),
      ),
    );
  }
}
