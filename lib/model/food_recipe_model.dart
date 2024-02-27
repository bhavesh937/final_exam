
class FoodRecipe {
  final int id;
  final String name;
  final String description;



  FoodRecipe({
    required this.name,
    required this.description,
    required this.id,
  });

  factory FoodRecipe.fromJson(Map<String, dynamic> toMap) {
    return FoodRecipe(
      id: toMap['id'],
      name: toMap['name'],
      description: toMap['description']??'',
    );
  }


}


