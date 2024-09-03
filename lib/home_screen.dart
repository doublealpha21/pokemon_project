import 'package:flutter/material.dart';
import 'package:pokemon_project/pokdex_card.dart';
import 'package:pokemon_project/services/list2.dart';
import 'services/model_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get futurePost => null;

  // late Future<Pokemon> futurePokemon;
  late Future<Result> futurePokemonResult;
  @override
  void initState() {
    super.initState();
    // futurePokemon = fetchPokemon();
    futurePokemonResult = futurePokemonResult;
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: const Text(
          'Pokedex',
        ),
        centerTitle: true,
      ),
      body: ListView(padding: const EdgeInsets.all(16), children: const [
        PokedexCard(),
        SizedBox(
          height: 20,
        ),
        PokedexCard(),
        SizedBox(
          height: 20,
        ),
        PokedexCard(),
      ]),
    );
  }
}
