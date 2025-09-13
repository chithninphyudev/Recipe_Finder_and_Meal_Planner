import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/recipe_card.dart';
import '../../search/views/search_page.dart';
import '/features/home/controllers/random_recipe_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomRecipesAsyncValue = ref.watch(randomRecipeControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Finder & Meal Planner'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ));
            },
          ),
        ],
      ),
      body: Center(
        child: randomRecipesAsyncValue.when(
          data: (recipes) {
            return RefreshIndicator(
              onRefresh: () async {
                await ref
                    .read(randomRecipeControllerProvider.notifier)
                    .refresh();
              },
              child: GridView.builder(
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return RecipeCard(recipe: recipe);
                },
              ),
            );
          },
          loading: () {
            return const CircularProgressIndicator();
          },
          error: (error, stack) {
            return Text('Error: $error');
          },
        ),
      ),
    );
  }
}
