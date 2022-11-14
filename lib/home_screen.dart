import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/DisplayMore.dart';
import 'package:provider/provider.dart';
import '../Resources/GlobalHelper.dart';
import 'DisplayImage.dart';
import 'Resources/MovieTile.dart';
import 'package:url_launcher/url_launcher.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}


class _HomeScreen extends State<HomeScreen> {
  static late GlobalHelper helper;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    helper = Provider.of<GlobalHelper>(context);
  }



  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
           SliverAppBar(
            title: const Text("MyMovies", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black), textAlign: TextAlign.center, ),
            pinned: true,
            centerTitle: true,
            backgroundColor: const Color(0xfffffaf3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
             expandedHeight: 200,
             elevation: 0,
             flexibleSpace: const FlexibleSpaceBar(
               background: Image(image: AssetImage('assets/movie.jpg'),fit: BoxFit.cover,),
             ),


          ),
          SliverPersistentHeader(
              delegate: SectionHeader("Sci-fi", const Color(0xff100d0e)),
              pinned: true,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: helper.getSci().length,
                  itemBuilder: (context, index) {
                    return  SizedBox(
                      height: 180,
                      width: 250,
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayImage(helper.scifi[index], "Sci-Fi", helper.sci_IMDb[index]))),
                        onLongPressStart: (LongPressStartDetails details) {
                          _showPopupMenu(details.globalPosition, index,helper.scifi_names, helper.scifi, helper.scifi_dir,
                              helper.sci_stars, helper.sci_yr, helper.sci_times, helper.sci_reviews, helper.sci_wiki, helper.sci_IMDb);
                        },
                        child: Card(
                          elevation: 30,
                          shadowColor: const Color(0xfffe9c72),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              Expanded(
                                  flex: 1,
                                  child: Image(image: AssetImage('assets/${helper.scifi[index]}'), fit: BoxFit.fill,),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: ListTile(
                                    title: Text(helper.scifi_names[index], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                    subtitle: Text("${helper.scifi_dir[index]}\n${helper.sci_yr[index]}", style: const TextStyle(fontSize: 14),),
                                    isThreeLine: true,
                                  )
                              )
                            ],
                          ),
                        ),
                      ));
                  }
              ),
            )
          ),
          SliverPersistentHeader(
            delegate: SectionHeader("Action", const Color(0xff100d0e)),
            pinned: true,
          ),
          SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: helper.getAction().length,
                    itemBuilder: (context, index) {
                      return  SizedBox(
                          height: 180,
                          width: 250,
                          child: GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayImage(helper.action[index], "Action", helper.action_imdb[index]))),
                            onLongPressStart: (LongPressStartDetails details) {
                              _showPopupMenu(details.globalPosition, index,helper.action_names, helper.action, helper.action_dir,
                                  helper.action_stars, helper.action_yr, helper.action_times, helper.action_reviews, helper.action_wiki, helper.action_imdb);
                            },
                            child: Card(
                              elevation: 30,
                              shadowColor: const Color(0xfffe9c72),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  const Padding(padding: EdgeInsets.only(left: 10)),
                                  Expanded(
                                    flex: 1,
                                    child: Image(image: AssetImage('assets/${helper.action[index]}'), fit: BoxFit.fill,),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: ListTile(
                                        title: Text(helper.action_names[index], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                        subtitle: Text("${helper.action_dir[index]}\n${helper.action_yr[index]}", style: const TextStyle(fontSize: 14),),
                                        isThreeLine: true,
                                      )
                                  )
                                ],
                              ),
                            ),
                          ));
                    }
                ),
              )
          ),
          SliverPersistentHeader(
            delegate: SectionHeader("Horror", const Color(0xff100d0e)),
            pinned: true,
          ),
          SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: helper.getHorror().length,
                    itemBuilder: (context, index) {
                      return  SizedBox(
                          height: 180,
                          width: 250,
                          child: GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayImage(helper.horror[index], "Sci-Fi", helper.horror_imdb[index]))),
                            onLongPressStart: (LongPressStartDetails details) {
                              _showPopupMenu(details.globalPosition, index,helper.horror_names, helper.horror, helper.horror_dir,
                                  helper.horror_stars, helper.horror_yr, helper.horror_times, helper.horror_reviews, helper.horror_wiki, helper.horror_imdb);
                            },
                            child: Card(
                              elevation: 30,
                              shadowColor: const Color(0xfffe9c72),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  const Padding(padding: EdgeInsets.only(left: 10)),
                                  Expanded(
                                    flex: 1,
                                    child: Image(image: AssetImage('assets/${helper.horror[index]}'), fit: BoxFit.fill,),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: ListTile(
                                        title: Text(helper.horror_names[index], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                        subtitle: Text("${helper.horror_dir[index]}\n${helper.horror_yr[index]}", style: const TextStyle(fontSize: 14),),
                                        isThreeLine: true,
                                      )
                                  )
                                ],
                              ),
                            ),
                          ));
                    }
                ),
              )
          ),
          SliverPersistentHeader(
            delegate: SectionHeader("Romance", const Color(0xff100d0e)),
            pinned: true,
          ),
          SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: helper.getRomance().length,
                    itemBuilder: (context, index) {
                      return  SizedBox(
                          height: 180,
                          width: 250,
                          child: GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayImage(helper.romance[index], "Sci-Fi", helper.romance_imdb[index]))),
                            onLongPressStart: (LongPressStartDetails details) {
                              _showPopupMenu(details.globalPosition, index,helper.romance_names, helper.romance, helper.romance_dir,
                                  helper.romance_stars, helper.romance_yr, helper.romance_times, helper.romance_reviews, helper.romance_wiki, helper.romance_imdb);
                            },
                            child: Card(
                              elevation: 30,
                              shadowColor: const Color(0xfffe9c72),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  const Padding(padding: EdgeInsets.only(left: 10)),
                                  Expanded(
                                    flex: 1,
                                    child: Image(image: AssetImage('assets/${helper.romance[index]}'), fit: BoxFit.fill,),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: ListTile(
                                        title: Text(helper.romance_names[index], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                        subtitle: Text("${helper.romance_dir[index]}\n${helper.romance_yr[index]}", style: const TextStyle(fontSize: 14),),
                                        isThreeLine: true,
                                      )
                                  )
                                ],
                              ),
                            ),
                          ));
                    }
                ),
              )
          ),
          SliverPersistentHeader(
            delegate: SectionHeader("Comedy", const Color(0xff100d0e)),
            pinned: true,
          ),
          SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: helper.getComedy().length,
                    itemBuilder: (context, index) {
                      return  SizedBox(
                          height: 180,
                          width: 250,
                          child: GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayImage(helper.comedy[index], "Sci-Fi", helper.comedy_imdb[index]))),
                            onLongPressStart: (LongPressStartDetails details) {
                              _showPopupMenu(details.globalPosition, index,helper.comedy_names, helper.comedy, helper.comedy_dir,
                                  helper.comedy_stars, helper.comedy_yr, helper.comedy_times, helper.comedy_reviews, helper.comedy_wiki, helper.comedy_imdb);
                            },
                            child: Card(
                              elevation: 30,
                              shadowColor: const Color(0xfffe9c72),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  const Padding(padding: EdgeInsets.only(left: 10)),
                                  Expanded(
                                    flex: 1,
                                    child: Image(image: AssetImage('assets/${helper.comedy[index]}'), fit: BoxFit.fill,),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: ListTile(
                                        title: Text(helper.comedy_names[index], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                        subtitle: Text("${helper.comedy_dir[index]}\n${helper.comedy_yr[index]}", style: const TextStyle(fontSize: 14),),
                                        isThreeLine: true,
                                      )
                                  )
                                ],
                              ),
                            ),
                          ));
                    }
                ),
              )
          ),
        ],
      ),
    );
  }

  _showPopupMenu(Offset offset, int index, List<String> name, List<String> poster, List<String> dir,
      List<String> stars, List<String> yr, List<String> times, List<String> reviews, List<String> wiki, List<String> imdb) async {
    final screenSize = MediaQuery.of(context).size;
    double left = offset.dx;
    double top = offset.dy;
    double right = screenSize.width - offset.dx;
    double bottom = screenSize.height - offset.dy;
    // await is called it will render this first and then it will continue with the following
    // instruction in the code
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, right, bottom),
      items: [
        PopupMenuItem(
          child: const Text("More Info"),
          onTap: () => Future(
                  () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => DisplayMore(name[index], poster[index], dir[index], stars[index], yr[index], times[index], reviews[index]),
                        ),
                ),
          )
        ),
        PopupMenuItem(
          child: Text("Wiki"),
          onTap: () => _launch(wiki[index]),
        ),
        PopupMenuItem(
          child: Text("IMDb"),
          onTap: () => _launch(imdb[index]),
        ),
      ],
      elevation: 8.0,
    );
    // following instructions.....
  }

  _launch(String _url)  async {
    Uri url = Uri.parse(_url);
    await launchUrl(url);
  }
  

}


class SectionHeader extends SliverPersistentHeaderDelegate {
  final String title;
  final Color color;
  
  SectionHeader(this.title, this.color);
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(title, style: const TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold,
      ),),
    );
  }
  @override
  double get maxExtent => 60;
  @override
  double get minExtent => 60;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}