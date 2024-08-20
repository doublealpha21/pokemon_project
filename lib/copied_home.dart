// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_json_parser/models/pokemon.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: HomePage(),
//     debugShowCheckedModeBanner: false,
//   ));
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   List<dynamic> pokemonList = [];
//
//   Future<void> readJson() async {
//     final String response = await rootBundle.loadString('assets/pokemon.json');
//     final data = await json.decode(response);
//
//     setState(() {
//       pokemonList =
//           data['pokemons'].map((data) => Pokemon.fromJson(data)).toList();
//     });
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     readJson();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leadingWidth: 20,
//         leading: IconButton(
//             padding: EdgeInsets.only(left: 20),
//             onPressed: () {},
//             icon: Icon(
//               Icons.arrow_back_ios,
//               color: Colors.grey.shade600,
//             )),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(
//                 iconSize: 30,
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.notifications_none,
//                   color: Colors.grey.shade400,
//                 )),
//           )
//         ],
//         title: Container(
//           height: 45,
//           child: TextField(
//             cursorColor: Colors.grey,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//               filled: true,
//               fillColor: Colors.grey.shade200,
//               prefixIcon: Icon(Icons.search, color: Colors.grey),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50),
//                   borderSide: BorderSide.none),
//               hintText: "Search e.g Pokemon",
//               hintStyle: TextStyle(fontSize: 14),
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         child: ListView.builder(
//             padding: EdgeInsets.all(20),
//             itemCount: pokemonList.length,
//             itemBuilder: (context, index) {
//               return pokemonComponent(pokemon: pokemonList[index]);
//             }),
//       ),
//     );
//   }
//
//   pokemonComponent({required Pokemon pokemon}) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       margin: EdgeInsets.only(bottom: 15),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 0,
//               blurRadius: 2,
//               offset: Offset(0, 1),
//             ),
//           ]),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Row(children: [
//                   Container(
//                       width: 60,
//                       height: 60,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         child: Image.asset(pokemon.image),
//                       )),
//                   SizedBox(width: 10),
//                   Flexible(
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             pokemon.name,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text(pokemon.category,
//                               style: TextStyle(color: Colors.grey[500])),
//                         ]),
//                   )
//                 ]),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     pokemon.isMyFav = !pokemon.isMyFav;
//                   });
//                 },
//                 child: AnimatedContainer(
//                     height: 35,
//                     padding: EdgeInsets.all(5),
//                     duration: Duration(milliseconds: 300),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(
//                           color: Colors.grey.shade300,
//                         )),
//                     child: Center(
//                         child: pokemon.isMyFav
//                             ? Icon(
//                           Icons.favorite,
//                           color: Colors.red,
//                         )
//                             : Icon(Icons.favorite_outline,
//                             color: Colors.grey.shade600))),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       padding:
//                       EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: Colors.grey.shade200),
//                       child: Text(
//                         pokemon.category,
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Container(
//                       padding:
//                       EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       // child: Text(pokemon.abilities, style: const TextStyle(color: Colors.white),),
//                     )
//                   ],
//                 ),
//                 Row(
//
//                   children: [
//                   SizedBox(height: 50,),
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             Container(
//               width: width * 0.3,
//               child: Text('Name', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
//             ),
//             Container(
//               child: Text(widget.pokemonDetail['name'], style: TextStyle(color: Colors.black, fontSize: 17),),
//             ),
//
//           ],
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             Container(
//               width: width * 0.3,
//               child: Text('Height', style: TextStyle(color: Colors.blueGrey, fontSize: 17),),
//             ),
//             Container(
//               child: Text(widget.pokemonDetail['height'], style: TextStyle(color: Colors.black, fontSize: 17),),
//             ),
//
//           ],
//
//         )
//         ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
//
