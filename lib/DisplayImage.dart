import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/Resources/GlobalHelper.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';



class DisplayImage extends StatelessWidget {

  final String poster;
  final String name;
  final String url;

   DisplayImage(this.poster, this.name, this.url);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff100d0e),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600,
        fontSize: 30),) ,
      ),
     body: Center(
       child: GestureDetector(
         onTap: () => { _launch(url)},
         child: Image.asset("assets/$poster",
         width: MediaQuery.of(context).size.width ,
          height: MediaQuery.of(context).size.height ,
          fit: BoxFit.cover,
    ),
       ),
     ));
  }


  _launch(String _url)  async {
    Uri url = Uri.parse(_url);
    await launchUrl(url);
  }
}