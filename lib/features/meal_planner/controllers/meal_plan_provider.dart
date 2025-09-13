import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../data/models/meal_plan.dart';

final mealPlanProvider =
    StateNotifierProvider<MealPlanNotifier, List<MealPlan>>(
        (ref) => MealPlanNotifier());

class MealPlanNotifier extends StateNotifier<List<MealPlan>> {
  late Box<MealPlan> _box;

  MealPlanNotifier() : super([]) {
    _init();
  }

  Future<void> _init() async {
    _box = Hive.box<MealPlan>('weekly_meal_plan');
    state = _box.values.toList();
  }

  Future<void> setMeal({
    required int dayIndex,
    required String mealName,
    required int recipeId,
    required String recipeName,
  }) async {
    final key = _box.keys.firstWhere(
      (k) =>
          _box.get(k)?.dayIndex == dayIndex &&
          _box.get(k)?.mealName == mealName,
      orElse: () => null,
    );

    final meal = MealPlan(
      dayIndex: dayIndex,
      mealName: mealName,
      recipeId: recipeId,
      recipeName: recipeName,
    );

    if (key != null) {
      await _box.put(key, meal);
    } else {
      await _box.add(meal);
    }

    state = _box.values.toList();
  }

  Future<void> removeMeal(
      {required int dayIndex, required String mealName}) async {
    final key = _box.keys.firstWhere(
      (k) =>
          _box.get(k)?.dayIndex == dayIndex &&
          _box.get(k)?.mealName == mealName,
      orElse: () => null,
    );
    if (key != null) await _box.delete(key);
    state = _box.values.toList();
  }

  List<MealPlan> mealsForDay(int dayIndex) {
    return state.where((m) => m.dayIndex == dayIndex).toList();
  }
}
