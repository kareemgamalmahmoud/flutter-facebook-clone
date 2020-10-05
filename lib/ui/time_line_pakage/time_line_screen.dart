import 'package:facebookclone/ui/time_line_pakage/home.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text("Facebook",
            style: TextStyle(
              color: Colors.blueAccent,
                fontSize: 26.0
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home , color: Colors.black54,)),
              Tab(icon: Icon(Icons.people , color: Colors.black54,)),
              Tab(icon: Icon(Icons.play_arrow , color: Colors.black54,)),
              Tab(icon: Icon(Icons.notifications , color: Colors.black54,)),
              Tab(icon: Icon(Icons.menu , color: Colors.black54,)),
            ],
          ),

          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    size: 26.0,
                    color: Colors.black54,
                  ),
                )
            ),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                      Icons.chat,
                    color: Colors.black54,
                  ),
                )
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            homepage(),
            Icon(Icons.card_giftcard),
            Icon(Icons.card_giftcard),
            Icon(Icons.card_giftcard),
            ListView(
              children: const <Widget>[
                Card(
                  child: ListTile(
                    leading: Icon(Icons.videogame_asset , color: Colors.red,),
                    title: Text('See More'),
                    trailing: Icon(Icons.keyboard_arrow_down),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help & Support'),
                    trailing: Icon(Icons.keyboard_arrow_down),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Setting & Privacy'),
                    trailing: Icon(Icons.keyboard_arrow_down),
                  ),
                ),

                Card(
                  child: ListTile(
                    leading: Icon(Icons.call_missed_outgoing),
                    title: Text('Log Out'),
                  ),
                ),


              ],
            ),
          ],
        ),

      ),
    );
  }


}