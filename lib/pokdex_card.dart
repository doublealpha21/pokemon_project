import 'package:flutter/material.dart';
import 'package:pokemon_project/model_page.dart';

class PokedexCard extends StatefulWidget {
  const PokedexCard({super.key});

  @override
  State<PokedexCard> createState() => _PokedexCardState();
}

class _PokedexCardState extends State<PokedexCard> {
  late Future<Pokemon> futurePokemon;

  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemon();
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
      child: Row(
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
                                ?.copyWith(),
                          ),
                          Text(
                            'Name:${pokemon.data!.name}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(),
                          ),
                          Text(
                            'Base Experience:${pokemon.data!.baseExperience}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(),
                          ),
                          Text(
                            'Order:${pokemon.data!.order.toString()}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(),
                          ),
                          Text(
                            'Height:${pokemon.data!.height.toString()}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(),
                          ),
                          Text(
                            pokemon.data!.weight.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(),
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
            padding: const EdgeInsets.all(4),
            width: width * 0.5,
            child: Image.asset('images/pokeball_image.jpg'),
          )
        ],
      ),
    );
  }
}
