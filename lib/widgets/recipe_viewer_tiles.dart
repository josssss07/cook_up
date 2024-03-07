// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class RecipeViewer extends StatelessWidget {
  RecipeViewer({super.key, required this.recipeName});
  String recipeName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
            color: Colors.grey[800],
            boxShadow: [BoxShadow(color: Colors.amber, spreadRadius: 3)],
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                recipeName,
                style: TextStyle(
                  color: Colors.grey[100],
                  fontSize: 18
                ),
              ),
              Icon(
                Icons.receipt,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
