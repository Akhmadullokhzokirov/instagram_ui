import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_ui/packages/feed_page.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPage = 0;
  var _pages = [
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        centerTitle: true,
        title: Text("INSTAGRAM",style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: Icon(EvaIcons.cameraOutline,color: Colors.black,),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(EvaIcons.tv,color: Colors.black,),
          ),
            IconButton(
               onPressed: () {},
             icon: Icon(EvaIcons.paperPlane,color: Colors.black,),
          ),
        ],
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i) {
          setState(() {
            currentPage = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.home),
            label: ("Feed")
          ),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.home),
              label:("Search")
          ),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.home),
              label: ("Search")
          ),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.home),
              label: ("Upload")
          ),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.home),
              label: ("Feed")
          ),
        ],
      ),
    );
  }
}
