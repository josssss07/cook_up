// ignore_for_file: unused_local_variable, library_private_types_in_public_api

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
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

                return ListTile(
                  title: GestureDetector(
                    onTap: () {
                      print(recipeindex);
                    },
                    child: RecipeViewer(recipeName: recipeName),
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

