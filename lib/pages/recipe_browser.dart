// ignore_for_file: unused_local_variable, library_private_types_in_public_api, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_up/services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:cook_up/utils/AppColor.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:cook_up/HiveManager.dart';

import '../widgets/recipe_viewer_tiles.dart';

class RecipeBrowser extends StatefulWidget {
  const RecipeBrowser({super.key});

  @override
  _RecipeBrowserState createState() => _RecipeBrowserState();
}

class _RecipeBrowserState extends State<RecipeBrowser> {
  TextEditingController searchInputController = TextEditingController();

  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 246, 238),
      appBar: AppBar(
        //backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Recipes',
            style: TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w400,
                fontSize: 20)),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getRecipesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List recipesList = snapshot.data!.docs;

            return ListView.builder(
              itemCount: recipesList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot documentSnapshot = recipesList[index];
                String docID = documentSnapshot.id;

                Map<String, dynamic> data =
                    documentSnapshot.data() as Map<String, dynamic>;
                String recipeName = data['name'];
                int recipeindex = data['id'];
                String instructions = data['directions'];
                String ingridients = data['ingredients'];
                return ListTile(
                  title: GestureDetector(
                    onTap: () {
                      print(recipeindex);
                    },
                    child: GestureDetector(
                        onTap: () {
                          // Navigator.of(context)
                          //     .push(MaterialPageRoute(builder: (_)));
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (context) => SizedBox(
                              height: 800,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        recipeName,
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
                                        ingridients,
                                        style: TextStyle(fontSize: 20),
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
                                        instructions,
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
                        child: RecipeViewer(recipeName: recipeName)),
                  ),
                );
              },
            );
          } else {
            return const Text("No recipes found");
          }
        },
      ),
    );
  }
}
