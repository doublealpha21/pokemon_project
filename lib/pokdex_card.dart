import 'package:flutter/material.dart';
import 'package:pokemon_project/model_page.dart';

class PokedexCard extends StatefulWidget {
  const PokedexCard({Key? key}) : super(key: key);

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
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: Colors.white,
        shape: BoxShape.rectangle,
      ),
      // width: double.infinity,
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              FutureBuilder<Pokemon>(
                future: futurePokemon,
                builder: (context, pokemon) {
                  if (pokemon.hasData) {
                    return Text(
                      pokemon.data!.name,
                      // style:
                      //     Theme.of(context).textTheme.headlineLarge?.copyWith(
                      //           color: Colors.red,
                      //         ),
                    );
                  } else if (pokemon.hasError) {
                    return Text('${pokemon.error}');
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
              FutureBuilder<Pokemon>(
                  future: futurePokemon,
                  builder: (context, pokemon) {
                    if (pokemon.hasData) {
                      return ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            pokemon.data!.abilities;
                            return ListTile(
                              title: Text(
                                pokemon.data!.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      color: Colors.red,
                                    ),
                              ),
                            );
                          });
                    } else if (pokemon.hasError) {
                      return Text('${pokemon.error}');
                    }
                    return const CircularProgressIndicator();
                  })
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: [
          //       Container(
          //         width: width * 0.3,
          //         child: const Text(
          //           'Height',
          //           style: TextStyle(color: Colors.blueGrey, fontSize: 17),
          //         ),
          //       ),
          //       Container(
          //         child: const Text(
          //           '',
          //           // widget.pokemonDetail['height'],
          //           style: TextStyle(color: Colors.black, fontSize: 17),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: [
          //       Container(
          //         width: width * 0.3,
          //         child: const Text(
          //           'Weight',
          //           style: TextStyle(color: Colors.blueGrey, fontSize: 17),
          //         ),
          //       ),
          //       Container(
          //         child: const Text(
          //           '',
          //           // widget.pokemonDetail['height'],
          //           style: TextStyle(color: Colors.black, fontSize: 17),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
