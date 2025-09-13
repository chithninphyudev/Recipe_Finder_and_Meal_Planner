import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/models/recipe_by_ingredients.dart';
import '/core/services/api_service.dart';

part 'recipes_by_ingredients_controller.g.dart';

@riverpod
class RecipesByingredientsController extends _$RecipesByingredientsController {
  
  @override
  Future<List<RecipeByIngredients>> build(List<String> ingredients) async {
    List<RecipeByIngredients> recipes = await ref.watch(apiServiceProvider).findRecipesByIngredients(ingredients);
    return recipes;
  }

}
