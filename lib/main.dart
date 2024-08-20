import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(Pokedex_Project());
}

class Pokedex_Project extends StatelessWidget {
  const Pokedex_Project({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
