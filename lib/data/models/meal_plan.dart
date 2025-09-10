import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'meal_plan.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class MealPlan {
  @HiveField(0)
  final int dayIndex;

  @HiveField(1)
  final String mealName;

  @HiveField(2)
  final String recipeId;

  const MealPlan({
    required this.dayIndex,
    required this.mealName,
    required this.recipeId,
  });

  factory MealPlan.fromJson(Map<String, dynamic> json) =>
      _$MealPlanFromJson(json);

  Map<String, dynamic> toJson() => _$MealPlanToJson(this);
}
