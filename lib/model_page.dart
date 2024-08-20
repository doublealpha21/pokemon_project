import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Pokemon {
  final int id;
  final String name;
  final int base_Experience;
  final int order;
  final int height;
  final int weight;
  final List abilities;

  const Pokemon({
    required this.id,
    required this.name,
    required this.base_Experience,
    required this.order,
    required this.height,
    required this.weight,
    required this.abilities,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'base_experience': int base_Experience,
        'order': int order,
        'height': int height,
        'weight': int weight,
        'abilities': int abilities,
      } =>
        Pokemon(
          name: name,
          height: height,
          weight: weight,
          base_Experience: base_Experience,
          id: id,
          order: order,
          abilities: [],
        ),
      _ => throw const FormatException('Failed to load Pokemon.'),
    };
  }
}

Future<Pokemon> fetchPokemon() async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/20'));

  if (response.statusCode == 200) {
    return Pokemon.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load Pokemon from Server');
  }
}
