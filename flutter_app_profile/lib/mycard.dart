import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mStyle = GoogleFonts.damion(
      color: Colors.white,
      fontSize: 26,
    );

    var mStyleTwo = GoogleFonts.sourceSansPro(
      color: Colors.white,
      letterSpacing: 8,
      fontWeight: FontWeight.bold,
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,

      body: SafeArea(
        child: columns(mStyle, mStyleTwo)),
      ),
    );
  }

  Column columns(TextStyle mStyle, TextStyle mStyleTwo) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          createAvatar(),
          myText("Zied Tuihri", mStyle),
          myText("Mobile Developer", mStyleTwo),
          myDivider(),
          myCard("50 123 123", Icons.phone),
          myCard("ziedtuihri@gmail.com", Icons.email),
        ],
      );
  }

  Divider myDivider() {
    return Divider(
      color: Colors.white,
      indent: 10,
      endIndent: 10,
    );
  }

  createAvatar(){
    return CircleAvatar(
      backgroundImage: AssetImage("images/me.jpg"),
      radius: 80,
      );
  }

  myText(String text, TextStyle myStyle){
    return Text(
      text,
      style: myStyle,
    );
  }

  myCard(String text, IconData icon){
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.teal,
        ),
        title: Text(text),
      )
    );
  }

}