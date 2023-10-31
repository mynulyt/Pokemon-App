import 'package:flutter/material.dart';
import 'package:pok_mon/pages/details_page.dart';

import 'power_badge.dart';

class PokemonCard extends StatelessWidget {
  final String name;
  final List<String> types;
  final String imageur;
  final Map? pokemonMap;
  const PokemonCard({
    super.key,
    required this.name,
    required this.types,
    required this.imageur,
    required this.pokemonMap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => DetailsPage(data: pokemonMap)),
        );
      },
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff4ad0b0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$name",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  PowerBadge(text: "${types[0]}"),
                  // PowerBadge(text: "${types[1]}"),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Hero(
              tag: "PokeCard-${name}",
              child: Image.network(
                "$imageur",
                width: 100.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
