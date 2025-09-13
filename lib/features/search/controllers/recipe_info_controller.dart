import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/models/recipe.dart';
import '/core/services/api_service.dart';

part 'recipe_info_controller.g.dart';

@riverpod
class RecipeInfoController extends _$RecipeInfoController {
  
  @override
  Future<Recipe> build(int id) async {
    Recipe recipe = await ref.watch(apiServiceProvider).getRecipeInformation(id);
    return recipe;
  }

}
