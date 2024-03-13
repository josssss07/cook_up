
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cook_up/models/search_filter_model.dart';
import 'package:cook_up/widgets/receipe_tile.dart';
import 'package:flutter/services.dart';
import 'package:cook_up/dump_notneeded/fetch_ing.dart';
import 'package:cook_up/dump_notneeded/recipie_details.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:cook_up/HiveManager.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var searchResult;
  bool shouldLisn = false;
  late Future<List<RecipeWithDetails>> future;

  SpoonacularRecipes spoonacularRecipes = SpoonacularRecipes();
  Future<List<RecipeWithDetails>> fetchData(String searchText) async {
    try {
      searchResult =
          await spoonacularRecipes.fetchRecipesByIngredients(searchText);
      print("ran");
      print(searchResult.runtimeType);
      return searchResult;
    } catch (e) {
      print("Error fetching data: $e");
      rethrow;
      // Handle error appropriately, e.g., show an error message
    }
  }

  TextEditingController searchInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    print(searchInputController.text.isEmpty);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Search Recipe',
            style: TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w400,
                fontSize: 20)),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Search
          Container(
            width: MediaQuery.of(context).size.width,
            height: 145,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Search TextField
                      Expanded(
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: TextField(
                            controller: searchInputController,
                            onSubmitted: (value) async {
                              print(value);
                              Future<List<RecipeWithDetails>> future2  =  fetchData(searchInputController.text);
                              setState(() {
                                future = future2;
                              });
                            },
                            style: const TextStyle(
                                color: Color.fromARGB(255, 246, 246, 246),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                            maxLines: 1,
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                              hintText: 'What do you want to eat?',
                              hintStyle: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)
                                          .withOpacity(0.2)),
                              prefixIconConstraints:
                                  const BoxConstraints(maxHeight: 20),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 17),
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      // Filter Button
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              // backgroundColor: Colors.white,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              builder: (context) {
                                return const SearchFilterModal();
                              });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Image.asset(
                            'assets/icons/edit.png',
                            width: 30,
                            height: 30,
                            color: const Color.fromARGB(255, 200, 196, 196),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // Search Keyword Recommendation
                Container(
                  height: 60,
                  margin: const EdgeInsets.only(top: 8),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    // itemCount: popularRecipeKeyword.length,
                    itemCount: 10,
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 8);
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.topCenter,
                        child: TextButton(
                          onPressed: () {
                            // searchInputController.text = popularRecipeKeyword[index];
                            print('will require backend');
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: const Color.fromARGB(255, 0, 0, 0)
                                    .withOpacity(0.9),
                                width: 1),
                          ),
                          child: Text(
                            // popularRecipeKeyword[index],
                            'Index of popular recipe',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 38, 37, 37)
                                    .withOpacity(0.7),
                                // backgroundColor: const Color.fromARGB(255, 87, 84, 84),
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          // Section 2 - Search Result
          Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: const Text(
                    'This is the result of your search..',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
                FutureBuilder(
                  future: fetchData(searchInputController.text),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<RecipeWithDetails>? searchResult = snapshot.data;
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: searchResult!.length,
                        //itemCount: 5,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 16);
                        },
                        itemBuilder: (context, index) {
                          return RecipeTile(
                            data: searchResult[index],
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
                   const Center(
                    child: CircularProgressIndicator())

              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*


*/