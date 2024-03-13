import 'dart:convert';
import 'package:http/http.dart' as http;
import 'recipie_details.dart';

class SpoonacularRecipes {
  final String apiKey = "Your api key";

  Future<List<RecipeWithDetails>> fetchRecipesByIngredients(
      String ingredients) async {
    final url = Uri.parse(
        "https://api.spoonacular.com/recipes/search?apiKey=$apiKey&includeIngredients=$ingredients");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final dynamic data = jsonDecode(response.body)["results"];
      if (data != null && data is List) {
        List<RecipeWithDetails> list1 = [];
        for (var recipeJson in data) {
          RecipeWithDetails recipe = await _fetchRecipeDetails(recipeJson);
          list1.add(recipe);
        }
        return list1;
      } else {
        throw Exception("Invalid data format");
      }
    } else {
      throw Exception("Failed to fetch recipes");
    }
  }

  Future<RecipeWithDetails?> fetchRecipeByName(String recipeName) async {
    final url = Uri.parse(
        "https://api.spoonacular.com/recipes/search?apiKey=$apiKey&query=$recipeName");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["results"] as List;
      if (data.isNotEmpty) {
        // Assuming the first recipe is the desired one
        return _fetchRecipeDetails(data[0]);
      } else {
        throw Exception("Invalid data format"); // No recipe found
      }
    } else {
      throw Exception("Failed to fetch recipe");
    }
  }

  Future<RecipeWithDetails> _fetchRecipeDetails(
      Map<String, dynamic> recipeJson) async {
    final recipeId = recipeJson["id"];

    final url = Uri.parse(
        "https://api.spoonacular.com/recipes/$recipeId/information?apiKey=$apiKey&includeInstructions=true");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final details = jsonDecode(response.body);
      // print(details);
      return RecipeWithDetails(
        id: details["id"],
        title: details["title"],
        image: details["image"],
        ingredients: (details["extendedIngredients"] as List<dynamic>)
            .map((ingredient) => ingredient["name"].toString())
            .toList(),
        instructions: details["instructions"],
      );
    } else {
      throw Exception("Failed to fetch recipe details");
    }
  }
}
