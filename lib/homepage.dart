import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/animated.dart';
import 'package:pokemon/model.dart';
import 'package:pokemon/provider.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();

    pokeman();
  }

  Future<void> pokeman() async {
    try {
      var response =
          await http.get(Uri.parse("https://dummyapi.online/api/pokemon"));
      if (response.statusCode == 200) {
        setState(() {
          _data = jsonDecode(response.body);

          List<dynamic> pokemonData = _data;
          Provider.of<PokemonProvider>(context, listen: false)
              .fetchData(pokemonData);
        });
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            width: size.width,
            decoration: BoxDecoration(color: Color(0xff1242c4)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "asset/download-removebg-preview.png",
                  scale: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    "Who are you looking for?",
                    style: TextStyle(color: Colors.white70, fontSize: 21),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Container(
                    height: 45,
                    width: 330,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 224, 219, 219),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "E.g Pikachu",
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 14),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 95, 133, 151),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                "Go",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Consumer<PokemonProvider>(builder: (context, Provider, child) {
            if (Provider.data.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Animated(
                                      name: _data[index]['pokemon'],
                                      pic: _data[index]['image_url'],
                                      id: _data[index]['id'],
                                      type: _data[index]['type'],
                                    )));
                      },
                      child: Hero(
                        tag: "back",
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(26, 202, 202, 202),
                            borderRadius: BorderRadius.circular(
                                10), // Example: Add rounded corners
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _data[index]['pokemon'].toString(),
                                      style: TextStyle(
                                        color: Color(0xff21a6ef),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '#00${_data[index]['id'].toString()}',
                                      style: TextStyle(
                                        color: Color(0xff21a6ef),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Expanded(
                                  child: Center(
                                    child: Image.network(
                                      _data[index]["image_url"].toString(),
                                      scale: 0.6,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: const Color.fromARGB(
                                            255, 34, 110, 74),
                                      ),
                                      child: Center(
                                        child: Text(
                                          _data[index]['type'].toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.blue,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Poison",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
