import 'dart:convert';
import 'package:http/http.dart' as http;

class Pokemon {
  final int id;
  final String name;
  final int baseExperience;
  final int order;
  final int height;
  final int weight;
  final List abilities;

  const Pokemon({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.order,
    required this.height,
    required this.weight,
    required this.abilities,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    // var list = json['abilities'] as List;
    // List<Abilities> abilitiesList = list.map((i)=> Abilities.fromJson(i)).toList()

    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'base_experience': int baseExperience,
        'order': int order,
        'height': int height,
        'weight': int weight,
        'abilities': List abilities,
      } =>
        Pokemon(
          id: id,
          name: name,
          baseExperience: baseExperience,
          order: order,
          height: height,
          weight: weight,
          abilities: abilities,
        ),
      _ => throw const FormatException('Failed to load Pokemon.'),
    };
  }
}

Future<Pokemon> fetchPokemon() async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/26'));

  if (response.statusCode == 200) {
    return Pokemon.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load Pokemon from Server');
  }
}

// void getData() async {
//   http.Response response =
//       await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/25'));
//
//   if (response.statusCode == 200) {
//     String data = response.body;
//
//     var forms = jsonDecode(data)['abilities'][0]['ability']['name'];
//     print(forms);
//
//     var name = jsonDecode(data)['baseExperience'];
//     print(name);
//
//     var title = jsonDecode(data)['name'];
//     print(title);
//   } else {
//     // throw Exception('Failed to load Pokemon from Server');
//     print(response.statusCode);
//   }
// }

