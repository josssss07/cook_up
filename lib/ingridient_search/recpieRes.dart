// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result({
    super.key,
    required this.name,
    required this.ingridients,
    required this.directions,
  });
  String name;
  List<String> ingridients;
  String directions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                'Ingridients needed: ',
                style: TextStyle(fontSize: 26),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ingridients!
                    .map((string) => Text(
                          string,
                          style: TextStyle(fontSize: 18),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Instructions: ",
                style: TextStyle(fontSize: 26),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  directions,
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
