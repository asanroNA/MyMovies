import 'package:flutter/material.dart';
import 'package:project2/Resources/GlobalHelper.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

void main()=> runApp(myApp());


class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => GlobalHelper(),
      child: MaterialApp(
        title: "Movie Lists",
        theme: ThemeData(
         scaffoldBackgroundColor: const Color(0xfffffaf3),
        ),
        home:  HomeScreen(),

      ));
  }

}


