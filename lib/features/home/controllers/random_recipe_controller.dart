import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/data/models/recipe.dart';
import '/core/services/api_service.dart';

part 'random_recipe_controller.g.dart';

@riverpod
class RandomRecipeController extends _$RandomRecipeController {
  List<Recipe>? _cachedRecipes;
  DateTime? _lastFetch;

  @override
  Future<List<Recipe>> build() async {
    if (_cachedRecipes != null &&
        _lastFetch != null &&
        DateTime.now().difference(_lastFetch!) < Duration(minutes: 30)) {
      return _cachedRecipes!;
    }

    final recipes = await ref.watch(apiServiceProvider).getRandomRecipes();
    _cachedRecipes = recipes;
    _lastFetch = DateTime.now();
    return recipes;
  }

  Future<void> refresh() async {
    final recipes = await ref.watch(apiServiceProvider).getRandomRecipes();
    _cachedRecipes = recipes;
    _lastFetch = DateTime.now();
    state = AsyncValue.data(recipes);
  }
}
