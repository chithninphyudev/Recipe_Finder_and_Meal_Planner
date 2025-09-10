import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../recipe_details/views/recipe_detail.dart';
import '/features/home/controllers/random_recipe_controller.dart';
import '/data/models/recipe.dart';

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
            icon: const Icon(Icons.favorite),
            onPressed: () {
              //
            },
          ),
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () {
              //
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              //
            },
          ),
        ],
      ),
      body: Center(
        child: randomRecipesAsyncValue.when(
          data: (recipes) {
            return GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.75,
              ),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return _RecipeCard(recipe: recipe);
              },
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

class _RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const _RecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    print('object');
                  },
                  icon: Icon(Icons.favorite),
                ),
              ),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16.0)),
                  image: DecorationImage(
                    image: NetworkImage(
                      recipe.image,
                      headers: {"Access-Control-Allow-Origin": "*"},
                    ),
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      return;
                    },
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetail(recipe: recipe),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    recipe.summary,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
