import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pokemon_project/services/model_page.dart';
import 'services/list2.dart';

class PokedexCard extends StatefulWidget {
  const PokedexCard({super.key});

  @override
  State<PokedexCard> createState() => _PokedexCardState();
}

class _PokedexCardState extends State<PokedexCard> {
  late Future<Pokemon> futurePokemon;
  late Future<PokemonList> futurePokemonList;
  late Future<Result> futurePokemonResult;
  List<Result> allpokemonlist = [];

  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemon();
    futurePokemonList = fetchPokemonList();
    futurePokemonResult = futurePokemonResult;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        color: Colors.green[100],
        // shape: BoxShape.rectangle,
      ),
      // height: height,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  FutureBuilder<Pokemon>(
                    future: futurePokemon,
                    builder: (context, pokemon) {
                      if (pokemon.hasData) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Id:${pokemon.data!.id}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Colors.black),
                              ),
                              Text(
                                'Name:${pokemon.data!.name}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Colors.black),
                              ),
                              Text(
                                'Base Experience:${pokemon.data!.baseExperience}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Colors.black),
                              ),
                              Text(
                                'Order:${pokemon.data!.order.toString()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Colors.black),
                              ),
                              Text(
                                'Height:${pokemon.data!.height.toString()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Colors.black),
                              ),
                              Text(
                                pokemon.data!.weight.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                              // ListView.builder(
                              //     itemCount: 3,
                              //     itemBuilder: (context, index) {
                              //       pokemon.data!.abilities;
                              //       return ListTile(
                              //         title: Text(
                              //           pokemon.data!.name,
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .displayMedium
                              //               ?.copyWith(
                              //                 color: Colors.red,
                              //               ),
                              //         ),
                              //       );
                              //     })
                            ],
                          ),
                        );
                      } else if (pokemon.hasError) {
                        return Text('${pokemon.error}');
                      }
                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: width * 0.4,
                decoration: const BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Image.network(
                    'http://www.serebii.net/pokemongo/pokemon/025.png'),
              )
            ],
          ),
          Container(
            height: 20,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
