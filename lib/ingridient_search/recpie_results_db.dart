// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecipeTileExtended extends StatelessWidget {
  final String? name;
  final List<String> ingredients;
  final String description;

  RecipeTileExtended({
    Key? key,
    required this.name,
    required this.ingredients,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (context) => Container(
                            height: 900,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      name!,
                                      style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          12, 2, 12, 0),
                                      child: Divider(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      'Ingridients: ',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      '',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: ingredients!
                                          .map((string) => Text(
                                                string,
                                                style: TextStyle(fontSize: 18),
                                              ))
                                          .toList(),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      'Directions: ',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      description,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'close',
                                            style: TextStyle(fontSize: 18),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width / 1.32,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 224, 180, 123),
                                    spreadRadius: 3)
                              ],
                              borderRadius: BorderRadius.circular(22)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("$name"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.receipt, color: Colors.white),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
