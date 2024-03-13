// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:cook_up/HiveManager.dart';
import 'recpie_for_disaster.dart';

class RecipeGenerator extends StatefulWidget {
  const RecipeGenerator({super.key});

  @override
  State<RecipeGenerator> createState() => _RecipeGeneratorState();
}

class _RecipeGeneratorState extends State<RecipeGenerator> {
   List<Recipe>? result = [];
      List<Recipe>recipeget = [];
  late List<Recipe> storedRecipes1;
  List<Recipe>? find(String ingredients) {
    List<Recipe> storedRecipes = HiveManager.getRecipes();
    for (Recipe recipe in storedRecipes) {
      for(int i= 0; i<recipe.ingredients.length ; i++){
        if(recipe.ingredients[i] == ingredients){
          // print('Ingredients: ${recipe.ingredients}');
          recipeget.add(recipe);

        }
      }
      // print('Ingredients: ${recipe.ingredients[0]}');
      // print('Directions: ${recipe.directions}');
      // print('PK: ${recipe.pk}');
      // print('-------------------------------------');
    }
              return recipeget;
  }

  TextEditingController ingridients = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var myBox = HiveManager.myBox;
    // Retrieve recipes from Hive

    List<Recipe> storedRecipes1 = HiveManager.getRecipes();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your ingridients: '),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            result = find(ingridients.text); 
            recipeget = [];         
          });
        },
        child: Icon(
          Icons.search,
          color: Colors.black,
        ),
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
              ),

              Container(
                width: MediaQuery.sizeOf(context).width / 1.2,
                height:MediaQuery.sizeOf(context).height,
                child: ListView.builder(
                  itemCount: result!.length,
                  itemBuilder: (context , index){
                    return RecipeTileExtended(name:result![index]!.name, ingredients:result![index]!.ingredients, description: result![index]!.directions);
                  }
                    

                      //add ui for it
//  print('Recipe Name: ${recipe.name}');
//     print('Ingredients: ${recipe.ingredients}');
//     print('Directions: ${recipe.directions}');
//     print('PK: ${recipe.pk}');
//     print('-------------------------------------');
    
                  
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
