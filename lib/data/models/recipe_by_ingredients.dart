import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
import 'package:recipe_finder_and_meal_planner/data/models/ingredient.dart';

part 'recipe_by_ingredients.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class RecipeByIngredients {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final String imageType;

  @HiveField(4)
  final int usedIngredientCount;

  @HiveField(5)
  final int missedIngredientCount;

  @HiveField(6)
  final List<Ingredient> missedIngredients;

  @HiveField(7)
  final List<Ingredient> usedIngredients;

  @HiveField(8)
  final List<Ingredient> unusedIngredients;

  @HiveField(9)
  final int likes;

  RecipeByIngredients({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
    required this.usedIngredientCount,
    required this.missedIngredientCount,
    required this.missedIngredients,
    required this.usedIngredients,
    required this.unusedIngredients,
    required this.likes,
  });

  factory RecipeByIngredients.fromJson(Map<String, dynamic> json) =>
      _$RecipeByIngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeByIngredientsToJson(this);
}
