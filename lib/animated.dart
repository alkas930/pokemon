import 'package:flutter/material.dart';

class Animated extends StatefulWidget {
  const Animated({super.key, required this.name, this.pic, this.type, this.id});
  final dynamic name;
  final dynamic pic;
  final dynamic type;

  final dynamic id;

  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "back",
        child: Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(
            color: Color.fromARGB(26, 202, 202, 202),
            borderRadius:
                BorderRadius.circular(10), // Example: Add rounded corners
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name.toString(),
                      style: TextStyle(
                        color: Color(0xff21a6ef),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '#00${widget.id.toString()}',
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
                      widget.pic.toString(),
                      scale: 0.1,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 34, 110, 74),
                      ),
                      child: Center(
                        child: Text(
                          widget.type.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
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
  }
}
