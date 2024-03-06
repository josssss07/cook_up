// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cook_up/pages/ingrident_search.dart';
import 'package:cook_up/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  int _indexSelected = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widget = <Widget>[
    SearchPage(),
    SearchIngridients(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GNav(
          rippleColor: const Color.fromARGB(255, 179, 60, 60)!,
          hoverColor: const Color.fromARGB(255, 209, 29, 29)!,
          gap: 8,
          activeColor: Colors.black,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: Duration(milliseconds: 400),
          tabBackgroundColor: const Color.fromARGB(255, 140, 33, 33)!,
          color: const Color.fromARGB(255, 163, 48, 48),
          tabs: [
            GButton(
              icon: Icons.search,
              text: 'Search',
              haptic: true,
            ),
            GButton(
              icon: Icons.book,
              text: 'Recipes',
              haptic: true,
            ),
          ],
          selectedIndex: _indexSelected,
          onTabChange: (index) {
            setState(() {
              _indexSelected = index;
            });
          }),
    );
  }
}
