// import 'package:cook_up/firebase_options.dart';
// import 'package:cook_up/firebase_options.dart';
import 'package:cook_up/pages/profilepage.dart';
import 'package:cook_up/pages/recipe_browser.dart';
import 'package:cook_up/dump_notneeded/search_page.dart';
import 'package:cook_up/utils/AppColor.dart';
import 'package:cook_up/utils/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:cook_up/HiveManager.dart';
// import 'firebase_options.dart';
// import 'package:hungry/views/screens/auth/welcome_page.dart';

void main() async {

List<Recipe> recipes = [
    Recipe(
    name: "Pancakes",
    ingredients: [
      "all-purpose flour", "sugar",
      "baking powder",
      "salt",
      "milk",
      "butter",
      "vegetable oil",
      "egg",
      "vegetable oil",
      "butter",
      "honey"
    ],
    directions: "Preheat oven to 200 degrees. Have a baking sheet or heatproof platter ready to keep cooked pancakes warm in the oven...",
    pk: 0
    ),
Recipe(
    name: "Overnight oats",
    ingredients: [
      "all-purpose flour",
      "sugar",
      "baking powder",
      "salt",
      "milk",
      "butter",
      "vegetable oil",
      "egg",
      "vegetable oil",
      "butter",
      "honey"
    ],
    directions:"Preheat oven to 200 degrees. Have a baking sheet or heatproof platter ready to keep cooked pancakes warm in the oven.In a small bowl, whisk together flour, sugar, baking powder, and salt; set aside.In a medium bowl, whisk together milk, butter (or oil), and egg.Add dry ingredients to milk mixture; whisk until just moistened. (Do not overmix; a few small lumps are fine.)\nIn a small bowl, whisk together flour, sugar, baking powder, and salt; set aside.\nIn a medium bowl, whisk together milk, butter (or oil), and egg.\nAdd dry ingredients to milk mixture; whisk until just moistened. (Do not overmix; a few small lumps are fine.)\nHeat a large skillet (nonstick or cast-iron) or griddle over medium. Fold a sheet of paper towel in half, and moisten with oil; carefully rub skillet with oiled paper towel.\nFor each pancake, spoon 2 to 3 tablespoons of batter onto skillet, using the back of the spoon to spread batter into a round (you should be able to fit 2 to 3 in a large skillet).\nCook until surface of pancakes have some bubbles and a few have burst, 1 to 2 minutes.\nFlip carefully with a thin spatula, and cook until browned on the underside, 1 to 2 minutes more.\nTransfer to a baking sheet or platter; cover loosely with aluminum foil, and keep warm in oven. Continue with more oil and remaining batter. (You'll have 12 to 15 pancakes.) Serve warm, with desired toppings.",
    pk: 1
    ),

Recipe(
    name: "Scrambled eggs",
    ingredients: [
      "eggs",
      "milk",
      "sriracha sauce",
      "salt",
      "pepper",
      "butter"
    ],
    directions: "Melt butter in nonstick pan over medium-low heat, tilting the pan to cover surface entirely with butter. Cook egg mixture in pan, stirring to slowly scramble eggs, until the eggs are fully set, 3 to 5 minutes.",
    pk: 2
    ),
Recipe(
    name: "Besan chilla",
    ingredients: [
      "besan",
      "gram",
      "flour",
      "tomatoes",
      "bell peppers",
      "capsicum",
      "chilies",
      "ginger",
      "coriander",
      "cumin",
      "salt",
      "water",
      "oil",
      "ghee"
    ],
    directions: "Add besan (gram flour), cumin seeds, and salt in a mixing bowl. You can add a pinch of turmeric powder for color and flavor.\n2. Add water and whisk the mixture to make a smooth batter. The batter should have a pouring consistency, similar to dosa batter.\n3. Add the chopped onions, tomatoes, bell peppers, green chilies, grated ginger, and fresh coriander leaves to the batter. Mix everything well.\n4. Heat a non-stick skillet or griddle (tava) and lightly grease it with oil or ghee.\n5. Pour a ladle full of the besan batter onto the skillet and spread it gently to form a round chilla. You can make them as thick or as thin as you prefer.\n6. Drizzle a few drops of oil or ghee around the edges of the chilla and a few drops on top.\nCook the chilla on medium heat until the base turns golden brown and crispy. Flip it and cook the other side until it's cooked and lightly browned.\n8. Remove the besan chilla from the griddle and serve hot with your favorite chutney or yogurt.\nYou can also experiment with different toppings, such as grated cheese, spinach, or grated paneer, to make variations of this healthy dish. Enjoy your quick and nutritious besan chilla!",
    pk: 3
    ),


Recipe(
    name: "Chicken fried rice",
    ingredients: [
      "basmati",
      "rice",
      "chicken",
      "vegetables",
      "carrots",
      "peas",
      "beans",
      "onion",
      "garlic",
      "ginger",
      "green chilies",
      "eggs",
      "soy",
      "sauce",
      "chili sauce",
      "vinegar",
      "garam masala",
      "turmeric powder",
      "salt",
      "oil",
      "coriander    "
    ],
    directions: "1. Heat oil in a large pan or wok over medium-high heat.\n2. Add diced chicken and cook until browned and cooked through. Remove and set aside.\n3. In the same pan, add more oil if needed. Add chopped onions and sauté until golden brown.\n4. Add minced garlic, grated ginger, and green chilies. Sauté for a minute.\n5. Stir in the mixed vegetables and cook until they are tender-crisp.\n6. Push the vegetables to one side of the pan and pour the beaten eggs into the other side. Scramble the eggs until cooked.\n7. Mix the cooked chicken back into the pan with the vegetables and eggs.\n8. Add soy sauce, chili sauce, vinegar, garam masala, turmeric powder, and salt. Stir well to combine.\n9. Add the cooked rice and toss everything together until well combined and heated through.\n10. Garnish with fresh coriander leaves and serve hot.",
    pk: 4
    ),



Recipe(
    name: "Alfredo Pasta",
    ingredients: [
      "pasta",
      "mixed vegetables",
      "broccoli",
      "peas",
      "carrots",
      "butter",
      "all purpose flour",
      "milk",
      "grated cheese",
      "salt and pepper",
      "garlic powder",
      "onion powder"
    ],
    directions: "1. Cook the pasta according to package instructions. Add mixed vegetables in the last 3-4 minutes of cooking. Drain and set aside.\n2. In a saucepan, melt butter over medium heat. Add flour and stir continuously for 1-2 minutes to make a roux.\n3. Gradually whisk in milk to the roux, ensuring no lumps form. Cook until the mixture thickens.\n4. Add grated Parmesan cheese, garlic powder, onion powder, nutmeg (if using), salt, and pepper. Stir until the cheese is melted and the sauce is smooth.\n5. Combine the cooked pasta and vegetables with the Alfredo sauce. Toss until everything is well coated.\n6. Serve the veg Alfredo pasta hot, garnished with extra cheese if desired. Enjoy your creamy and delicious dish!",
    pk: 5
    ),
Recipe(
    name: "Banana Bread",
    ingredients: [
      "bananas",
      "butter",
      "baking soda",
      "pinch of salt",
      "sugar",
      "egg",
      "vanilla",
      "all purpose flour"
    ],
    directions: "1. Preheat your oven to 350°F (175°C) and grease a baking dish, preferably one that looks like a loaf pan.\n2. In a mixing bowl, mash the ripe bananas with a fork.\n3. Add melted butter and mix well. Then, add sugar, eggs, and vanilla extract, stirring until combined.\n4. In a separate bowl, whisk together flour, baking soda, and salt.\n5. Gradually add the dry ingredients to the banana mixture, stirring until just combined.\n6. Pour the batter into the greased baking dish.\n7. Bake in the preheated oven for about 60-70 minutes or until a toothpick inserted into the center comes out clean.\n8. Allow the banana bread to cool in the dish for 10 minutes, then transfer it to a wire rack to cool completely before slicing.",
    pk: 6
    ),


Recipe(
    name: "3 ingredients Chocolate Cake",
    ingredients: [
      "all purpose flour",
      "condensed milk",
      "cocoa powder"
    ],
    directions: "1. Preheat your oven to 350°F (180°C) and grease a baking pan.\n2. In a mixing bowl, combine the all-purpose flour, sweetened condensed milk, and cocoa powder. Mix until you have a smooth batter.\n3. Pour the batter into the greased baking pan and spread it evenly.\n4. Bake in the preheated oven for 25-30 minutes or until a toothpick inserted into the center comes out clean.\n5. Allow the chocolate cake to cool before slicing and serving. Enjoy your simple and delicious homemade chocolate cake!",
    pk: 7
    ),


Recipe(
    name: "Chocolate Cake",
    ingredients: [
      "all purpose flour",
      "granulated sugar",
      "cocoa powder",
      "baking powder",
      "baking soda",
      "salt",
      "vegetable oil",
      "eggs",
      "vanilla",
      "water",
      "nuts",
      "cream"
    ],
    directions: "1. Preheat your oven to 350°F (180°C). Grease and flour a round cake pan or any baking dish you have available.\n2. In a large mixing bowl, sift together the flour, sugar, cocoa powder, baking powder, baking soda, and salt.\n3. Add the vegetable oil, eggs, and vanilla extract to the dry ingredients. Mix until well combined.\n4. Gradually pour in the warm water while stirring the batter until smooth.\n5. If desired, fold in chocolate chips or chopped nuts into the batter.\n6. Pour the batter into the prepared cake pan and spread it evenly.\n7. Bake in the preheated oven for 30-35 minutes or until a toothpick inserted into the center comes out clean.\n8. Remove the cake from the oven and let it cool in the pan for about 10 minutes before transferring it to a wire rack to cool completely.\n9. Once cooled, you can top the cake with whipped cream or any other desired toppings before serving. Enjoy your homemade chocolate cake!",
    pk: 8
    ),


Recipe(
    name: "Avacado Toast",
    ingredients: [
      "avocado",
      "lemon juice",
      "salt",
      "black pepper",
      "bread",
      "olive oil"
    ],
    directions: "In a small bowl, combine avocado, lemon juice, salt, and pepper. Gently mash with the back of a fork.Top toasted bread with mashed avocado mixture. Drizzle with olive oil and sprinkle over desired toppings. For perfect avocado toast, ingredient quality is key. Use fresh, crusty whole-wheat bread and the best extra-virgin olive oil you can find.",
    pk: 9
    ),


Recipe(
    name: "Hummus",
    ingredients: [
      "cooked chickpeas",
      "tahini",
      "extra-virgin olive oil",
      "fresh lemon juice",
      "garlic",
      "water",
      "sea salt"
    ],
    directions: "Add the chickpeas, tahini, lemon juice, olive oil, water, garlic, and salt to a high-speed blender, and process until smooth. As you blend, add more water, as needed, to reach your desired consistency. If your blender has a baton, you may want to use it to help get things going.",
    pk: 10
    ),


Recipe(
    name: "Ceaser ",
    ingredients: [
      "romaine lettuce",
      "cheese",
      "croutons",
      "raw egg yolks",
      "worcestershire sauce",
      "anchovies",
      "chickpeas",
      "pine nuts",
      "chives"    ],
    directions: "Toast the croutons, stir together the dressing, and prep the veggies in advance. Then, store the components separately until you're ready to eat. \nIf you're making this salad ahead, roast the chickpeas at the last minute, or omit them and toast a few extra croutons in their place.",
    pk: 11
    ),


Recipe(
    name: "Grilled Chicken",
    ingredients: [
      "chicken",
      "curd",
      "ginger paste",
      "garlic paste",
      "red chilli powder",
      "coriander powder",
      "cumin powder",
      "black pepper",
      "salt",
      "garam masala",
      "olive oil"    
    ],
    directions: "To prepare this easy chicken recipe, wash the chicken pieces and prick them with a fork. Now, in a large bowl, combine hung curd, ginger paste, garlic paste, olive oil, red chilli powder, coriander powder, cumin powder, black pepper, salt and garam masala. Stir all the ingredients together until well blended. Now add the chicken pieces and apply the masala mixture all over them. Cover and refrigerate for at least 8 hours or up to 24 hours. Once done, preheat the oven at 190 degree Celsius. Remove the chicken pieces from the marinade and place them on a grilling tray. Grill them for 1 hour, flipping them after 30 minutes so that both sides can cook evenly. Check if the chicken has fully cooked by taking one piece out and cutting it with a knife. Serve hot with salad or a dip.",
    pk: 12
    ),


Recipe(
    name: "Vegetable Pulaoe",
    ingredients: [
      "basmati rice",
      "vegetables",
      "carrots",
      "peas",
      "beans",
      "onion",
      "chilies",
      "ginger-garlic paste",
      "ghee",
      "whole spices",
      "cumin seeds",
      "cloves",
      "cinnamon",
      "cardamom",
      "turmeric powder",
      "coriander"
    ],
    directions: "Heat ghee or oil in a pan. Add whole spices (cumin seeds, cloves, cinnamon, cardamom). Add chopped onions, green chilies, and ginger-garlic paste. Sauté until onions are golden brown. Add mixed vegetables (carrots, peas, beans, etc.) and sauté for a few minutes. Add soaked basmati rice, water, salt, and a pinch of turmeric powder. Cook until the rice is done and the water is absorbed. Garnish with coriander leaves and serve hot.",
    pk: 13
    ),


Recipe(
    name: "Paneer Masala",
    ingredients: [
      "paneer",
      "onion",
      "tomato",
      "ginger-garlic paste",
      "oil",
      "cumin seeds",
      "turmeric powder",
      "coriander powder",
      "cumin powder",
      "garam masala",
      "salt",
      "coriander"
    ],
    directions: "Heat oil in a pan, add cumin seeds, chopped onions, and sauté until golden brown. Add ginger-garlic paste, chopped tomatoes, and cook until tomatoes are soft. Add powdered spices (turmeric, coriander, cumin, garam masala), salt, and mix well. Add cubed paneer and cook for a few minutes until paneer is coated with the masala. Garnish with coriander leaves and serve hot with rice or naan.",
    pk: 14
    ),


Recipe(
    name: "Palak Paneer",
    ingredients: [
      "spinach leaves",
      "paneer",
      "onion",
      "tomato",
      "ginger-garlic paste",
      "oil",
      "cumin seeds",
      "turmeric powder",
      "coriander powder",
      "cumin powder",
      "garam masala",
      "coriander"
    ],
    directions: "Blanch spinach leaves in hot water, then blend into a smooth paste. Heat oil in a pan, add cumin seeds, chopped onions, and sauté until golden brown. Add ginger-garlic paste, chopped tomatoes, and cook until tomatoes are soft. Add powdered spices (turmeric, coriander, cumin, garam masala), salt, and mix well. Add spinach puree and cubed paneer. Cook for a few minutes until flavors blend. Finish with a splash of cream (optional), garnish with cream and serve hot with naan or rice.",
    pk: 15
    ),


Recipe(
    name: "Gobi Manchurian",
    ingredients: [
      "cauliflower",
      "corn flour",
      "all-purpose flour",
      "salt",
      "pepper",
      "ginger-garlic paste",
      "oil",
      "garlic",
      "ginger",
      "green chilies",
      "onion",
      "bell peppers",
      "soy sauce",
      "chilli sauce",
      "tomato ketchup",
      "vinegar",
      "spring onions"
    ],
    directions: "Mix cauliflower florets with corn flour, all-purpose flour, salt, pepper, and ginger-garlic paste to form a thick batter. Deep fry the cauliflower florets until golden brown and crispy.In a separate pan, heat oil, add chopped garlic, ginger, green chilies, and sauté. Add chopped onions, bell peppers, and sauté until they soften.Add soy sauce, chili sauce, ketchup, vinegar, salt, and pepper to taste.Toss in the fried cauliflower florets and mix well until they are coated with the sauce.Garnish with spring onions and serve hot as an appetizer.",
    pk: 16  
    ),
  Recipe(
      name: "Aloo Gobi ",
      ingredients: [
        "potatoes",
        "cauliflower",
        "onion",
        "tomato",
        "garlic",
        "ginger",
        "green chilies",
        "cumin",
        "coriander",
        "turmeric",
        "garam masala"
      ],
      directions: "Parboil potatoes and cauliflower florets separately.\n In a pan, sauté onions, garlic, ginger, and green chilies.\n Add chopped tomatoes and cook until soft.\n Add boiled potatoes, cauliflower, and spices. Cook until vegetables are tender.\n Garnish with cilantro and serve hot with roti or rice.",
      pk: 17
      ),


  Recipe(
      name: "Jeera Aloo",
      ingredients: [
        "potatoes",
        "cumin seeds"
      ],
      directions: "Heat oil in a pan and add cumin seeds. Let them splutter. Add boiled potatoes and salt. Stir well to coat the potatoes with cumin seeds. Cook for a few minutes until the potatoes are slightly crispy. Serve hot.",
      pk: 18
      ),

  Recipe(
      name: "Mango Lassi",
      ingredients: [
        "ripe mango",
        "cup yogurt",
        "honey",
        "sugar"
      ],
      directions: "In a blender, combine diced mango, yogurt, and honey or sugar.Blend until smooth and creamy.Pour into glasses and serve chilled, garnished with a slice of mango if desired.",
      pk: 19
      ),

  Recipe(
      name: "Coconut ladoo",
      ingredients: [
        "desiccated coconut",
        "condensed milk",
        "cardamom powder"
      ],
      directions: "In a non-stick pan, combine desiccated coconut and condensed milk.Cook over low heat, stirring continuously, until the mixture thickens and starts to leave the sides of the pan.Remove from heat, add cardamom powder, and mix well. Let the mixture cool slightly.Grease your palms with ghee or butter and shape the mixture into small balls (ladoos). Allow them to cool completely before serving.",
      pk: 20
      ),
      Recipe(
    name: "Date and Nut ladoo",
    ingredients: [
        "dates",
        "nuts",
        "almonds",
        "cashews",
        "walnuts"
    ],
    directions: "In a food processor, blend the dates until they form a sticky paste.Add finely chopped nuts to the date paste and pulse until well combined.Take small portions of the mixture and roll them into balls using your hands.Optional: Roll the balls in desiccated coconut for coating.Place the balls on a plate and refrigerate for about 30 minutes to firm up before serving. Enjoy!",
    pk: 21
  ),

  Recipe(
      name: "Sticky Toffee Pudding",
      ingredients: [
        "dates",
        "bicarbonate",
        "unsalted butter",
        "brown sugar",
        "eggs",
        "vanilla",
        "self raising flour",
        "light brown sugar",
        "cream",
        "butter"
      ],
      directions: "1. Preheat your oven to 180°C (350°F). Grease a deep baking dish.\n2. Place the chopped dates in a bowl and pour the boiling water over them. Stir in the bicarbonate of soda and set aside for 10 minutes.\n3. In a separate bowl, cream together the softened butter and light brown sugar until light and fluffy. Beat in the eggs one at a time, then stir in the vanilla extract.\n4. Fold in the flour until just combined, then stir in the date mixture until evenly distributed.\n5. Pour the batter into the prepared baking dish and smooth the top with a spatula. Bake in the preheated oven for 30-35 minutes, or until a skewer inserted into the center comes out clean.\n6. While the pudding is baking, make the toffee sauce. In a saucepan, combine the light brown sugar, double cream, and butter. Heat gently, stirring constantly, until the sugar has dissolved and the sauce is smooth and slightly thickened.\n7. Once the pudding is baked, remove it from the oven and prick it all over with a fork. Pour half of the warm toffee sauce over the top, allowing it to soak in.\n8. Serve the sticky toffee pudding warm, drizzled with extra toffee sauce and accompanied by vanilla ice cream or whipped cream, if desired. Enjoy!",
      pk: 22
      ),

Recipe(
    name: "Hara Bhara Kebab Roll",
    ingredients: [
        "potatoes",
        "spinach",
        "peas",
        "coriander",
        "paneer",
        "jeera powder",
        "chilli powder",
        "amchoor powder",
        "garam masala powder",
        "garlic",
        "green chilli",
        "ginger",
        "besan",
        "bread crumbs"
    ],
    directions: "Start by boiling the peas for 3-4 minute, in the same water add the spinach for 30 seconds and transfer everything in ice cold water.\n- Add that to a blender with coriander, green chilli, ginger garlic and blend it to make a smooth paste\n- In a plate grate potatoes and paneer together\n- To that add green paste, roasted besan, spices like chilli powder, amchur powder, jeera powder, garam masala, salt and pepper. \nBind it until nicely combined, make small tikkis, add half a piece of cashew and pan fry it on both sides\n- For assembling, heat up the roti, put some beetroot dip at the base, break the tikkis and place them in a straight line, on top add pickle onions, chaat masala and some chopped coriander\n- Squeeze some lemon juice on top and your hara bhara roll is ready to be devoured!\n",
    pk: 23
  ),

Recipe(
    name: "Peri Peri Broccoli Bowl",
    ingredients: [
        "short grain rice",
        "butter",
        "coriander",
        "lime juice",
        "olive oil",
        "mushroom",
        "garlic cloves",
        "butter",
        "flour",
        "milk",
        "salt pepper",
        "peri peri powder",
        "sugar",
        "coriander",
        "lime juice",
        "broccoli",
        "salt",
        "pepper"
    ],
    directions: "Cook the rice and add melted butter, lemon juice and chopped coriander to it and keep it aside.\n- For the broccoli, boil it for 2-3 minutes until tender and smash it to make it flat\n- Add some olive oil to a pan and charr the broccoli on both sides\n- Season it with salt, pepper and peri peri powder as per taste\n- Now for the sauce, Heat olive oil in a pan and sauté the mushroom and garlic\n- Add butter to the vegetables and let it melt\n- Mix in some flour and keep on mixing so it doesn't get stuck to the pan \nGradually add some milk while mixing it continuously to prevent the flour from clumping\n- Season the sauce with peri peri powder, salt and pepper\n- Top it off with some chopped coriander and lemon juice\n- For assembling press down the rice in a bowl with a small bowl in the centre to create a cavity, place the charred broccoli in the cavity and top it off with the peri peri sauce and enjoy! \n\n",
    pk: 24
  ),

Recipe(
    name: "Chicken 65",
    ingredients: [
        "breast chicken",
        "salt",
        "chilli powder",
        "pepper",
        "garam masala",
        "cumin",
        "corinader powder",
        "haldi",
        "ginger garlic paste",
        "dahi",
        "egg",
        "maida",
        "cornflour sauce",
        "green chillies",
        "curry leaves",
        "cloves garlic chopped",
        "chilli sauce",
        "soy sauce",
        "vinegar",
        "sugar"
    ],
    directions: "- Clean and cut the chicken into small bite size pieces\n- Marinate the chicken with, dahi, ginger garlic paste,egg ,salt, chilli powder, cumin powder, coriander powder, haldi and garam masala\n- Let it marinate for atleast half an hour\n- Add flour and cornstarch to the marinated chicken and mix\n- Deep fry them until crispy, you can also air fry it\n- For the sauce, in a hot pan add oil and fry green chillies and curry leaves in it\n- Remove them from the oil, add the garlic and sauté, add a splash of water\n- In the end add your chilli sauce, soy sauce, vinegar and sugar\n- Toss the fried chicken in this sauce\n- Garnish with crushed curry leaves and green chilli and enjoy!\n",
    pk: 25
  ),

Recipe(
    name: "Berry Yogurt smoothie bowl",
    ingredients: [
        "strawberry",
        "raspberry",
        "blackberry",
        "banana",
        "greek yogurt",
        "almond milk",
        "soy milk",
        "peanut butter"
    ],
    directions: "-Add the berries, banana, Greek yogurt, almond milk, and peanut butter to a blender and blend until smooth.\n-Top with your favorite toppings.",
    pk: 26
  ),

Recipe(
    name: "Butter Chicken",
    ingredients: [
        "chicken",
        "chicken thighs",
        "chicken breasts",
        "plain yogurt",
        "minced garlic",
        "minced ginger",
        "garam masala",
        "turmeric",
        "ground cumin",
        "red chili powder",
        "salt",
        "olive oil",
        "ghee",
        "butter",
        "oil",
        "onion",
        "garlic",
        "ginger",
        "ground cumin",
        "garam masala",
        "coriander",
        "crushed tomatoes",
        "red chili powder",
        "salt",
        "heavy cream ",
        "thickened cream",
        "sugar",
        "kasoori methi",
        "fenugreek"
    ],
    directions: "In a bowl, combine chicken with all of the ingredients for the chicken marinade; let marinate for 30 minutes to an hour (or overnight if time allows).\nHeat oil in a large skillet or pot over medium-high heat. When sizzling, add chicken pieces in batches of two or three, making sure not to crowd the pan. Fry until browned for only 3 minutes on each side. Set aside and keep warm. (You will finish cooking the chicken in the sauce.)\nHeat butter or ghee in the same pan. Fry the onions until they start to sweat (about 6 minutes) while scraping up any browned bits stuck on the bottom of the pan. \nAdd garlic and ginger and sauté for 1 minute until fragrant, then add ground coriander, cumin and garam masala. Let cook for about 20 seconds until fragrant, while stirring occasionally.\nAdd crushed tomatoes, chili powder and salt. Let simmer for about 10-15 minutes, stirring occasionally until sauce thickens and becomes a deep brown red colour.\nRemove from heat, scoop mixture into a blender and blend until smooth. You may need to add a couple tablespoons of water to help it blend (up to 1/4 cup). Work in batches depending on the size of your blender.\nPour the puréed sauce back into the pan. Stir the cream, sugar and crushed kasoori methi (or fenugreek leaves) through the sauce. Add the chicken with juices back into the pan and cook for an additional 8-10 minutes until chicken is cooked through and the sauce is thick and bubbling.\nGarnish with chopped cilantro and serve with fresh, hot garlic butter rice and fresh homemade Naan bread!",
    pk: 27
  ),


Recipe(
    name: "Chole Bhature",
    ingredients: [
        "kabuli chana",
        "white chick peas",
        "tea bags",
        "tea powder (chai ki patti)",
        "oil",
        "cumin seeds",
        "onions",
        "ginger",
        "garlic",
        "chole masala",
        "chilli powder",
        "dried mango powder",
        "turmeric powder",
        "coriander",
        " cumin seeds",
        "jeera",
        "plain flour (maida)",
        "potatoes",
        "curd"
    ],
    directions: "For the chole\nCombine the kabuli chana, salt, tea leaf tied in muslin cloth and enough water in a pressure cooker and pressure cook for 3 whistles.\nAllow the steam to escape before opening the lid. Remove the tea powder tied in muslin cloth and drain the kabuli chana. Keep aside.\nHeat the oil in a deep non-stick pan and add the cumin seeds. Sauté on a medium flame for 30 seconds.\nAdd the onions, ginger and garlic and sauté on a medium flame for 1 to 2 minute or till the onions turn translucent.\nAdd the chole masala, chilli powder, dried mango powder, turmeric powder, coriander powder, cumin seeds powder, salt and 1 cup of water, mix well and cook on a medium flame for 1 to 2 minutes, while stirring occasionally.\nAdd the kabuli chana, mix well and cook on a medium flame for 5 to 7 minutes, while stirring occasionally. Mash the kabuli chana once lightly with a help of a masher. Switch off the flame, keep aside.\n\nFor the bhature\nCombine the flour, potatoes, curd, oil and salt and knead to make a soft dough using enough water.\nCover the dough with a wet muslin cloth and rest the dough for 20 minutes.\nDivide the dough into 8 equal portions and roll each portion into a 150 mm. (6”) diameter circle using a little plain flour for rolling.\nHeat the oil in a deep non-stick pan and deep-fry the bhatures, one at a time, till they turn golden brown in colour from both sides.",
    pk: 28
  ),

Recipe(
    name: "Aloo parantha",
    ingredients: [
        "kabuli chana",
        "white chick peas",
        "tea bags",
        "tea powder (chai ki patti)",
        "oil",
        "cumin seeds",
        "onions",
        "ginger",
        "garlic",
        "chole masala",
        "chilli powder",
        "dried mango powder",
        "turmeric powder",
        "coriander",
        " cumin seeds",
        "jeera",
        "plain flour (maida)",
        "potatoes",
        "curd"
    ],
    directions: "STEP 1\nCombine the honey, soy, rice vinegar and garlic in a small bowl. Mix the oil and butter in another bowl.\n\nSTEP 2\nHeat a griddle pan over a high heat until searing hot. Brush the pork chops all over with the oil and butter mixture, season, then cook for 4-6 mins, turning halfway, until cooked through.\n\nSTEP 3\nLift the pork out of the pan and onto a plate using tongs, then brush the honey mixture over both sides and return to the pan to cook for a further minute on each side. \n\nSTEP 4\nRest the chops for a couple of minutes, then drizzle over any juices from the pan to serve. Sprinkle with the parsley to finish, if you like.",
    pk: 29
  ),

Recipe(
    name: "Quick honey and garlic pork chop",
    ingredients: [
        "honey",
        "soy sauce",
        "rice vinegar",
        "garlic",
        "vegetable oil",
        "unsalted butter",
        "melted",
        "pork chops"
    ],
    directions: "STEP 1\nCombine the honey, soy, rice vinegar and garlic in a small bowl. Mix the oil and butter in another bowl.\n\nSTEP 2\nHeat a griddle pan over a high heat until searing hot. Brush the pork chops all over with the oil and butter mixture, season, then cook for 4-6 mins, turning halfway, until cooked through.\n\nSTEP 3\nLift the pork out of the pan and onto a plate using tongs, then brush the honey mixture over both sides and return to the pan to cook for a further minute on each side. \n\nSTEP 4\nRest the chops for a couple of minutes, then drizzle over any juices from the pan to serve. Sprinkle with the parsley to finish, if you like.",
    pk: 30
  ),

Recipe(
    name: "Dal makhani",
    ingredients: [
        "urad dal",
        "black lentils",
        "rajma",
        "red kidney beans",
        "ghee",
        "cloves",
        "cinnamon ",
        "cardamoms ",
        "bay leaf  ",
        "red onion",
        "ginger paste",
        "garlic paste",
        "green chili",
        "tomato",
        "red chili powder",
        "smoked paprika",
        "butter",
        "garam masala",
        "kasoori methi",
        "dried fenugreek leaves",
        "heavy whipping cream",
        "creammalai"
    ],
    directions: "Take whole urad and rajma in a colander and rinse under running cold water until water runs clear. \nMassage the lentils lightly using fingers while rinsing. \nAlternatively, you can rinse them in a bowl 2-3 times until the water is not cloudy anymore.\n\nSoak in enough water (2 inches above the lentils) for 8 hours or overnight. They will get doubled in size.\nDrain and discard the soaking water. Take soaked lentils in a pressure cooker (or instant pot) along with fresh water.\nStovetop pressure cooker: Cook on medium heat for 10-12 whistles (that is about 15 minutes).\nInstant pot: Cook on manual (high pressure) for 20 minutes.\nLet the pressure go down by itself and then open the lid. \nCheck by pressing a lentil or bean, it should mash easily without any effort.\nHeat the oil in a pan on medium heat.\nOnce hot add whole spices (cloves, cinnamon, black cardamoms, bay leaf). \nSaute for 40-60 seconds or until spices are aromatic.\nAdd chopped onion and sprinkle a little salt to speed up the cooking process. \nCook for 5 minutes or until onions is soft and light brown in color.\nAdd ginger-garlic paste. Saute for a minute or until the raw smell of ginger garlic goes away.\nAdd tomato puree and slit green chili. Cook until most of the water is evaporated and it becomes a thick paste.\nAdd red chili powder and smoked paprika. Mix and cook for a minute.\nAdd boiled lentils, remaining salt and little more water. Mix well and let it comes to a boil.\nAdd butter and let it simmer on low heat for 25-30 minutes. \nDo stir in between to make sure that it is not sticking to the bottom of the pan. \nIf it looks too thick then you can add a splash of more water.\nAdd garam masala and crushed kasoori methi. Mix well.\nAdd heavy cream. Mix and again simmer for 10 minutes on low.\nLastly, garnish dal makhani with freshly chopped cilantro.",
    pk: 31)
];


  await HiveManager.init();
  final myBox = HiveManager.myBox;
  //id , title, image,ingredients , recipe
    await HiveManager.saveRecipes(recipes);

  // Retrieve recipes from Hive
  List<Recipe> storedRecipes = HiveManager.getRecipes();

   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Open Sans',
        //scaffoldBackgroundColor: AppColor.primarySoft,
      ),
      //home: const RecipeBrowser(), //until navbar is completedw
      home: const Appbar(),
    );
  }
}
