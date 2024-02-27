import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'RecipeCard.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              height: 80,
              width: 100,
            ),
            const SizedBox(width: 10),
            const Text("Recipe Rover"),
          ],
        ),
      ),
      body: RecipeCard(),
    );
  }
}

class RecipeCard extends StatefulWidget {
  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController recipeNameController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController stepsController = TextEditingController();

  Future<void> addRecipe(String name, String ingredients, String steps) async {

    if (_formKey.currentState?.validate() ?? false) {

      final CollectionReference recipes =
          FirebaseFirestore.instance.collection('recipes');

      String recipeId = DateTime.now().millisecondsSinceEpoch.toString();

      await recipes.add({
        'id': recipeId,
        'name': name,
        'ingredients': ingredients,
        'steps': steps,
      }).then((_) {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                RecipeScreen(),
          ),
        );


        setState(() {
          recipeNameController.clear();
          ingredientsController.clear();
          stepsController.clear();
        });
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: recipeNameController,
                  decoration: const InputDecoration(
                    labelText: 'Recipe Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your recipe name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: ingredientsController,
                  decoration: const InputDecoration(
                    labelText: 'Ingredients',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your recipe Ingredients';
                    }
                    return null;
                  },
                  maxLines: 5,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: stepsController,
                  decoration: const InputDecoration(
                    labelText: 'Recipe',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Recipe';
                    }
                    return null;
                  },
                  maxLines: 5,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    addRecipe(
                      recipeNameController.text,
                      ingredientsController.text,
                      stepsController.text,
                    );
                  },
                  child: Text("Add Recipe"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

