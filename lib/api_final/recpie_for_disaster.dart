import 'package:flutter/material.dart';

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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name of the recipe: $name"),
                SizedBox(
                  height: 2,
                ),
                Text("Ingredients: $ingredients"),
                SizedBox(
                  height: 2,
                ),
                Text("Directions: $description")
              ],
            )
          ],
        ));
  }
}
