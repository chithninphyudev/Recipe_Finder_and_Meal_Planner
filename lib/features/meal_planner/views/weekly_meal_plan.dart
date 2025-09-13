import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_constants.dart';
import '../../../data/models/meal_plan.dart';
import '../controllers/meal_plan_provider.dart';

class WeeklyMealPlanPage extends ConsumerWidget {
  const WeeklyMealPlanPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(mealPlanProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Weekly Meal Plan")),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, dayIndex) {
          final meals =
              ref.read(mealPlanProvider.notifier).mealsForDay(dayIndex);

          return Card(
            margin: const EdgeInsets.all(10),
            child: ExpansionTile(
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
                  subtitle: Text(meal.recipeId != 0
                      ? "Recipe: ${meal.recipeName}"
                      : "No recipe"),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      //
                    },
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
