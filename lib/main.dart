import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_finder_and_meal_planner/data/models/step.dart';

import 'data/models/ingredient.dart';
import 'data/models/instruction.dart';
import 'data/models/meal_plan.dart';
import 'data/models/recipe.dart';
import 'layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(RecipeAdapter());
  Hive.registerAdapter(IngredientAdapter());
  Hive.registerAdapter(InstructionAdapter());
  Hive.registerAdapter(MealPlanAdapter());
  Hive.registerAdapter(StepAdapter());

  await Hive.openBox<Recipe>('favorite_recipes');
  await Hive.openBox<MealPlan>('weekly_meal_plan');

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Finder and Meal Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Layout(),
      debugShowCheckedModeBanner: false,
    );
  }
}
