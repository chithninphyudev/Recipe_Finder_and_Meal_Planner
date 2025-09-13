import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/recipe_card.dart';
import '../controllers/favorites_provider.dart';

class FavoriteRecipesPage extends ConsumerWidget {
  const FavoriteRecipesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteRecipes = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Recipes")),
      body: favoriteRecipes.isEmpty
          ? const Center(child: Text("No favorite recipes"))
          : GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.75,
              ),
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                final recipe = favoriteRecipes[index];
                return RecipeCard(recipe: recipe);
              },
            ),
    );
  }
}
