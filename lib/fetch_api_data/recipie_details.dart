class RecipeWithDetails {
  final int id;
  final String title;
  final String image;
  final List<String> ingredients;
  final String instructions;

  RecipeWithDetails({
    required this.id,
    required this.title,
    required this.image,
    required this.ingredients,
     required this.instructions,
  });
    @override
  String toString() {
    return 'RecipeWithDetails{id: $id, title: $title, image: $image, ingredients: $ingredients, instructions: $instructions}';
  }
}




// String = "salt chicken cheese pepper"