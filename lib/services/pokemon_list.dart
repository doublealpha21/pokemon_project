import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonList {
  final String name;
  final List results;

  const PokemonList({
    required this.name,
    required this.results,
  });

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'results': List results,
      } =>
        PokemonList(
          name: name,
          results: results,
        ),
      _ => throw const FormatException('Failed to load Data'),
    };
  }
}

Future<PokemonList> fetchPokemonList() async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=151'));

  if (response.statusCode == 200) {
    return PokemonList.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load Pokemon List');
  }
}

// class PokemonList {
//   int count;
//   String next;
//   Null previous;
//   List<Results> results;
//
//   PokemonList({this.count, this.next, this.previous, this.results});
//
//   PokemonList.fromJson(Map<String, dynamic> json) {
//     count = json['count'];
//     next = json['next'];
//     previous = json['previous'];
//     if (json['results'] != null) {
//       results = new List<Results>();
//       json['results'].forEach((v) {
//         results.add(new Results.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['count'] = this.count;
//     data['next'] = this.next;
//     data['previous'] = this.previous;
//     if (this.results != null) {
//       data['results'] = this.results.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Results {
//   String name;
//   String url;
//
//   Results({this.name, this.url});
//
//   Results.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     url = json['url'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['url'] = this.url;
//     return data;
//   }
// }
