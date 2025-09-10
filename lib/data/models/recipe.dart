import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

import 'ingredient.dart';
import 'instruction.dart';

part 'recipe.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class Recipe {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final int readyInMinutes;

  @HiveField(4)
  final int servings;

  @HiveField(5)
  final String sourceUrl;

  @HiveField(6)
  final bool vegetarian;

  @HiveField(7)
  final bool vegan;

  @HiveField(8)
  final bool glutenFree;

  @HiveField(9)
  final bool dairyFree;

  @HiveField(10)
  final double healthScore;

  @HiveField(11)
  final String summary;

  @HiveField(12)
  final List<Ingredient> extendedIngredients;

  @HiveField(13)
  final List<Instruction> analyzedInstructions;

  Recipe({
    required this.id,
    required this.title,
    required this.image,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
    required this.vegetarian,
    required this.vegan,
    required this.glutenFree,
    required this.dairyFree,
    required this.healthScore,
    required this.summary,
    required this.extendedIngredients,
    required this.analyzedInstructions,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) =>
      _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
