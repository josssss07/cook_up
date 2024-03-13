// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecipeGenerator extends StatefulWidget {
  const RecipeGenerator({super.key});

  @override
  State<RecipeGenerator> createState() => _RecipeGeneratorState();
}

class _RecipeGeneratorState extends State<RecipeGenerator> {
  TextEditingController ingridients = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your ingridients: '),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.sizeOf(context).width / 1.2,
                  child: TextField(
                    controller: ingridients,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusColor: Colors.amber,
                      fillColor: Colors.amber,
                      enabled: true,
                      enabledBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
