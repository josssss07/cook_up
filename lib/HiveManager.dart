import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Recipe {
  final String name;
  final List<String> ingredients;
  final String directions;
  final int pk;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.directions,
    required this.pk,
  });
}

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final int typeId = 0;

  @override
  Recipe read(BinaryReader reader) {
    return Recipe(
      name: reader.read(),
      ingredients: reader.read(),
      directions: reader.read(),
      pk: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer.write(obj.name);
    writer.write(obj.ingredients);
    writer.write(obj.directions);
    writer.write(obj.pk);
  }
}

class HiveManager {
  static late Box<Recipe> _myBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(RecipeAdapter());
    _myBox = await Hive.openBox<Recipe>('myBox');
  }

  static Box<Recipe> get myBox => _myBox;

  static Future<void> saveRecipes(List<Recipe> recipes) async {
    await _myBox.clear(); // Clear existing data
    await _myBox.addAll(recipes);
  }

  static List<Recipe> getRecipes() {
    return _myBox.values.toList();
  }
}
