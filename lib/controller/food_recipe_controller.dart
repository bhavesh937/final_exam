import 'package:cloud_firestore/cloud_firestore.dart';


import '../View/Screeb/RecipeCard.dart';
import '../helper/database_helper.dart';
import '../model/food_recipe_model.dart';


class FoodRecipeController extends GetxController {
  List<FoodRecipe> foodRecipes = <FoodRecipe>[];

  @override
  void onInit() {

    getDataFromDatabase();
  }

  getDataFromDatabase() async {
    foodRecipes = await DatabaseHelper.getItems();
    update();
  }

  addFav(String title, String des, String image, int id) async {
    await FirebaseFirestore.instance
        .collection('Recipes')
        .doc()
        .set({'title': title, 'des': des, 'image': image, 'id': id});
  }

  void update() {}
}


