import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/Resources/GlobalHelper.dart';

class DisplayMore extends StatelessWidget {
  final String name;
  final String poster;
  final String director;
  final String reviews;
  final String actors;
  final String times;
  final String yr;

  DisplayMore(this.name, this.poster, this.director, this.actors, this.yr, this.times, this.reviews);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff100d0e),
        centerTitle: true,
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600,
            fontSize: 30),) ,
      ),
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(60)),

          SizedBox(
            width: 170,
            height: 275,
            child: Card(
              elevation: 30,
              child: Image.asset("assets/$poster",
              fit: BoxFit.fill,),
            )
          ),
           Card(
             elevation: 15,
             shadowColor: const Color(0xfffe9c72),
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(15)
             ),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text("Director: $director\nCast: $actors\n$times\n$reviews", style: TextStyle(fontSize: 12), textAlign: TextAlign.center,),

               ],

             ),

          )
        ],
      ),
    );
  }
}