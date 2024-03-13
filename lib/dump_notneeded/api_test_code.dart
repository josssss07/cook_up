import 'dart:convert';
import 'package:http/http.dart' as http;

// Replace with your actual API key
const String apiKey = "YOUR API KEY";

// Function to fetch recipes based on ingredients
Future<List<dynamic>> fetchRecipesByIngredients(String ingredients) async {
  final url = Uri.parse(
      "https://api.spoonacular.com/recipes/search?apiKey=$apiKey&includeIngredients=$ingredients");

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body)["results"] as List;
    return data;
  } else {
    throw Exception("Failed to fetch recipes, try again later");
  }
}

// Example usage
// void main() async {
//   final ingredients = "chicken, rice, vegetables";
//   final recipes = await fetchRecipesByIngredients(ingredients);

//   // Process the recipes data here (e.g., print details)
//   for (final recipe in recipes) {
//     print(recipe["title"]);
//   }
// }
