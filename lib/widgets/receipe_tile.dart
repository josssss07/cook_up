import 'package:cook_up/fetch_api_data/recipie_details.dart';
import 'package:flutter/material.dart';

class RecipeTile extends StatelessWidget {
  final RecipeWithDetails data;
  
 RecipeTile({
  Key? key, 
  required this.data,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        height: 90,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 26, 26, 28),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // Recipe Photo
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(96, 125, 139, 1),
                image: const DecorationImage(
                  image: AssetImage('assets/images/pancakes.jpg'),
                  fit: BoxFit.cover),
              ),
            ),
            // Recipe Info
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Recipe title
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child:  Text(
                        data.title,
                        style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'inter', color: Colors.white),
                      ),
                    ),
                    // Recipe Calories and Time
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/pancakes.jpg',
                          color: Colors.white,
                          width: 12,
                          height: 12,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: const Text(
                            'Calories?',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.alarm,
                          size: 14,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: const Text(
                            'Time?',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}