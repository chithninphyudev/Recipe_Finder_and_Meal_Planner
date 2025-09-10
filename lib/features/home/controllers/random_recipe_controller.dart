import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/data/models/recipe.dart';
import '/core/services/api_service.dart';

part 'random_recipe_controller.g.dart';

@riverpod
class RandomRecipeController extends _$RandomRecipeController {
  @override
  Future<List<Recipe>> build() async {
    return await ref.watch(apiServiceProvider).getRandomRecipes();
  }
}
