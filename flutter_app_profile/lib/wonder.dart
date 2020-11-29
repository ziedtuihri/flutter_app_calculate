import 'dart:math';

import 'package:flutter/material.dart';

class Wonder extends StatefulWidget {
  Wonder() : super();

  @override
  _WonderState createState() => _WonderState();
}

class _WonderState extends State<Wonder> {

  var image = "europe.png";

  List<String> list = List.of({
    "england.png",
    "europe.png",
    "italy.png",
    "mexico.png"
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Image.asset("images/$image"),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => {
            generateRandomWonder(),
          },
          label: Text(image),
        ),
       ),
    );
  }

 generateRandomWonder() {
    var position = Random().nextInt(4);
    print(position);
    setState(() {
      image = list[position];
      print(image);
    });
  }

}