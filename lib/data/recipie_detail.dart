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
}
