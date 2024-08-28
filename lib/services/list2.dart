import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonList {
  PokemonList({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int? count;
  final String? next;
  final dynamic previous;
  final List<Result> results;

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    return PokemonList(
      count: json["count"],
      next: json["next"],
      previous: json["previous"],
      results: json["results"] == null
          ? []
          : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );
  }
}

class Result {
  Result({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      name: json["name"],
      url: json["url"],
    );
  }
}

Future<PokemonList> fetchPokemonList() async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=151'));

  if (response.statusCode == 200) {
    return PokemonList.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load Pokemon from Server');
  }
}
