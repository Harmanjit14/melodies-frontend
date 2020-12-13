import 'package:flutter/material.dart';
import 'package:melodies/pages/home.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  var _selectedTab = _SelectedTab.home;
  int index = 0;
  Widget changeState() {
    switch (index) {
      case 0:
        {
          return Home();
        }
        break;
      case 1:
        {
          return Home();
        }
        break;
      case 2:
        {
          return Home();
        }
        break;
      case 3:
        {
          return Home();
        }
        break;
      default:
        {
          return Home();
        }
    }
  }

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      setState(() {
        index = i;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: Container(
        //height: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SalomonBottomBar(
              currentIndex: _SelectedTab.values.indexOf(_selectedTab),
              onTap: _handleIndexChanged,
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: Icon(Icons.home_outlined),
                  title: Text("Home"),
                  selectedColor: Colors.blue[700],
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: Icon(Icons.favorite_border),
                  title: Text("Likes"),
                  selectedColor: Colors.pink,
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: Icon(Icons.search),
                  title: Text("Search"),
                  selectedColor: Colors.orange,
                ),

                /// Profile
                SalomonBottomBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Profile"),
                  selectedColor: Colors.teal,
                ),
              ],
            ),
          ],
        ),
      ),
      body: changeState(),
    );
  }
}

enum _SelectedTab { home, likes, search, profile }
