// ignore_for_file: unused_local_variable, library_private_types_in_public_api, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cook_up/services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:cook_up/utils/AppColor.dart';
import 'package:flutter/services.dart';

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
                //#TODO: GET THE RECIPE INSTRUCTIONS
                String instructions = data['directions'];
                String ingridients = data['ingredients'];
                return ListTile(
                  title: GestureDetector(
                    onTap: () {
                      print(recipeindex);
                    },
                    child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (context) => Container(
                              height: 400,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(recipeName),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(ingridients),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(instructions),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('close'))
                                  ],
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
