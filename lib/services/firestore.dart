import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get collection
  final CollectionReference recipes =
      FirebaseFirestore.instance.collection('Recipes');

  //read recipes from db (incomplete)
  Stream<QuerySnapshot> getRecipesStream() {
    final recipeStream = recipes.snapshots();

    return recipeStream;
  }
}
