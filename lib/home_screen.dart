import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokemon_project/pokdex_card.dart';
import 'model_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late Future<Pokemon> futurePokemon;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   futurePokemon = fetchPokemon();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokedex',
        ),
        centerTitle: true,
      ),
      body: ListView(padding: EdgeInsets.all(16), children: [
        PokedexCard(),
        SizedBox(
          height: 20,
        ),
        // PokedexCard(),
        // SizedBox(
        //   height: 20,
        // ),
        // PokedexCard(),
      ]),
    );
  }
}
