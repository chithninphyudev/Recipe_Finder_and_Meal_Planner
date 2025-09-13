import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/core/services/api_service.dart';

part 'autocomplete_ingredients_controller.g.dart';

@riverpod
class AutocompleteIngredientsController extends _$AutocompleteIngredientsController {
  
  @override
  Future<List<String>> build(String query) async {
    List<String> ingredients = await ref.watch(apiServiceProvider).autocompleteIngredients(query);
    return ingredients;
  }

}
