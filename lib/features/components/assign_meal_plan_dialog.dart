import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/recipe.dart';
import '../../core/constants/app_constants.dart';
import '../../data/models/meal_plan.dart';
import '../meal_planner/controllers/meal_plan_provider.dart';

class AssignMealPlanDialog extends ConsumerWidget {
  final Recipe recipe;

  const AssignMealPlanDialog({super.key, required this.recipe});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(mealPlanProvider);

    return AlertDialog(
      title: Text('Assign "${recipe.title}" to Weekly Meal Plan'),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, dayIndex) {
            final meals =
                ref.read(mealPlanProvider.notifier).mealsForDay(dayIndex);

            return ExpansionTile(
              title: Text(daysOfWeek[dayIndex]),
              children: mealsPerDay.map((mealName) {
                final meal = meals.firstWhere(
                  (m) => m.mealName == mealName,
                  orElse: () => MealPlan(
                    dayIndex: dayIndex,
                    mealName: mealName,
                    recipeId: 0,
                    recipeName: "",
                  ),
                );

                return ListTile(
                  title: Text(mealName),
                  subtitle: Text(
                    meal.recipeId != 0 ? "Recipe: ${meal.recipeName}" : "No Recipe",
                  ),
                  onTap: () async {
                    await ref.read(mealPlanProvider.notifier).setMeal(
                          dayIndex: dayIndex,
                          mealName: mealName,
                          recipeId: recipe.id,
                          recipeName: recipe.title,
                        );
                  },
                );
              }).toList(),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
