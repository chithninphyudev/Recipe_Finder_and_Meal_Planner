import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../search/controllers/recipe_info_controller.dart';
import '/data/models/ingredient.dart';
import '/data/models/recipe.dart';

class RecipeDetail extends ConsumerWidget {
  final Recipe? recipe;
  final int recipeId;

  const RecipeDetail({
    super.key,
    this.recipe,
    required this.recipeId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (recipe != null) {
      return _buildScaffold(context, recipe!);
    }

    final recipeAsync = ref.watch(recipeInfoControllerProvider(recipeId));
    return recipeAsync.when(
      data: (fetchedRecipe) => _buildScaffold(context, fetchedRecipe),
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, _) =>
          Scaffold(body: Center(child: Text("Error: $err"))),
    );
  }

  Widget _buildScaffold(BuildContext context, Recipe recipe) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (recipe.image.isNotEmpty)
              Image.network(
                recipe.image,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 220,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, size: 60),
                  );
                },
              ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                recipe.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 12,
                children: [
                  Chip(label: Text('${recipe.readyInMinutes} min')),
                  Chip(label: Text('${recipe.servings} servings')),
                  if (recipe.vegetarian) const Chip(label: Text('Vegetarian')),
                  if (recipe.glutenFree) const Chip(label: Text('Gluten Free')),
                  if (recipe.vegan) const Chip(label: Text('Vegan')),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Ingredients',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recipe.extendedIngredients
                    .map((Ingredient ingredient) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Text('- ${ingredient.name}'),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Steps',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recipe.analyzedInstructions
                    .expand((instruction) => instruction.steps.map((step) {
                          return Text(
                            "${step.number}. ${step.step}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        }))
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}