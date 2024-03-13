// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field

import 'package:cook_up/api_final/recpie_generator.dart';
import 'package:cook_up/pages/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../pages/recipe_browser.dart';

class Appbar extends StatefulWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  int _indexSelected = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    RecipeGenerator(),
    RecipeBrowser(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_indexSelected),
      bottomNavigationBar: GNav(
        haptic: true,
        backgroundColor: Colors.white,
        rippleColor: Color.fromARGB(255, 221, 214, 191),
        hoverColor: Color.fromARGB(255, 205, 192, 11),
        gap: 6,
        activeColor: Colors.black,
        iconSize: 24,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        duration: Duration(milliseconds: 400),
        tabBackgroundColor: Colors.amber,
        color: Color.fromARGB(255, 188, 147, 33),
        tabs: [
          GButton(
            icon: Icons.search,
            text: 'Search',
            onPressed: () {
              setState(() {
                _indexSelected = 0;
              });
            },
          ),
          GButton(
            icon: Icons.book,
            text: 'Recipes',
            onPressed: () {
              setState(() {
                _indexSelected = 1;
              });
            },
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
            onPressed: () {
              setState(() {
                _indexSelected = 2;
              });
            },
          )
        ],
      ),
    );
  }
}
