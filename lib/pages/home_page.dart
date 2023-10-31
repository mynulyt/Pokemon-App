import 'package:flutter/material.dart';
import 'package:pok_mon/pages/pokemon_data_source.dart';

import '../pokemon_card.dart';
import 'my_title.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  get color => null;

  List<Map?>? pokemonData = PokemonDataSource.pokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.format_list_bulleted_outlined,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTitle(
                text: "Pokedex",
                color: Colors.black,
              ),
              Expanded(
                flex: 12,
                child: Container(
                  child: GridView.builder(
                    itemCount: pokemonData!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 4 / 3,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0),
                    itemBuilder: (context, index) => PokemonCard(
                        name: "${pokemonData![index]!["name"]}",
                        types: [
                          pokemonData![index]!.containsKey("type")
                              ? "${pokemonData![index]!["type"]![0]}"
                              : "No Power",
                        ],
                        imageur: "${pokemonData![index]!["img"]}",
                        pokemonMap: pokemonData![index]),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
