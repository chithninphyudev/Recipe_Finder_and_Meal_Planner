import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_finder_and_meal_planner/features/recipe_details/views/recipe_detail.dart';
import '../../../data/models/recipe_by_ingredients.dart';
import '../controllers/autocomplete_ingredients_controller.dart';
import '../controllers/recipes_by_ingredients_controller.dart';

final selectedIngredientsProvider = StateProvider<List<String>>((ref) => []);

final searchTriggerProvider = StateProvider<List<String>>((ref) => []);

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _ingredientController = TextEditingController();

  void _addIngredient(String ingredient) {
    if (ingredient.isNotEmpty) {
      final current = [...ref.read(selectedIngredientsProvider)];
      if (!current.contains(ingredient)) {
        ref.read(selectedIngredientsProvider.notifier).state = [
          ...current,
          ingredient,
        ];
      }
      _ingredientController.clear();
    }
  }

  void _removeIngredient(String ingredient) {
    final current = [...ref.read(selectedIngredientsProvider)];
    current.remove(ingredient);
    ref.read(selectedIngredientsProvider.notifier).state = current;
  }

  @override
  Widget build(BuildContext context) {
    final selectedIngredients = ref.watch(selectedIngredientsProvider);
    final searchTrigger = ref.watch(searchTriggerProvider);

    final recipesAsync =
        ref.watch(recipesByingredientsControllerProvider(searchTrigger));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Recipes by Ingredients"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) async {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                final result = await ref.read(
                  autocompleteIngredientsControllerProvider(
                          textEditingValue.text)
                      .future,
                );
                return result;
              },
              onSelected: (String selection) {
                _addIngredient(selection);
              },
              fieldViewBuilder:
                  (context, controller, focusNode, onEditingComplete) {
                _ingredientController.text = controller.text;
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    hintText: "Enter ingredient",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.cancel_outlined),
                      onPressed: () {
                        controller.clear();
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: selectedIngredients.map((ingredient) {
                return Chip(
                  label: Text(ingredient),
                  deleteIcon: const Icon(Icons.close),
                  onDeleted: () => _removeIngredient(ingredient),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: selectedIngredients.isEmpty
                  ? null
                  : () {
                      ref.read(searchTriggerProvider.notifier).state = [
                        ...selectedIngredients
                      ];
                    },
              icon: const Icon(Icons.search),
              label: const Text("Search"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: recipesAsync.when(
                data: (recipes) {
                  if (recipes.isEmpty) {
                    return const Center(child: Text("No recipes found."));
                  }
                  return ListView.builder(
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      final RecipeByIngredients recipe = recipes[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RecipeDetail(recipeId: recipe.id),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: recipe.image.isNotEmpty
                                      ? Image.network(
                                          recipe.image,
                                          width: 30,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Icon(
                                                Icons.food_bank_outlined);
                                          },
                                        )
                                      : const Icon(Icons.food_bank_outlined),
                                  title: Text(recipe.title),
                                ),
                                Text(
                                  "Used: ${recipe.usedIngredients.map((e) => e.name).join(', ')}",
                                ),
                                Text(
                                  "Missing: ${recipe.missedIngredients.map((e) => e.name).join(', ')}",
                                ),
                                Text(
                                  "Unused: ${recipe.unusedIngredients.map((e) => e.name).join(', ')}",
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, _) => Center(child: Text("Error: $err")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
