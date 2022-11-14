import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MovieTile extends StatelessWidget{
  final int index;

  MovieTile(this.index);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 250,
      child: const Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white)
        ),
        elevation: 30,
        shadowColor: Color(0xff8990BD),

      ),


    );
  }
}
