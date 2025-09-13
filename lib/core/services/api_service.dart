import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_finder_and_meal_planner/data/models/ingredient.dart';
import 'package:recipe_finder_and_meal_planner/data/models/instruction.dart';
import '../../data/models/recipe_by_ingredients.dart';
import '/core/constants/api_constants.dart';
import '/data/models/recipe.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

class ApiService {
  final Dio _dio;

  ApiService() : _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)) {
    final cacheOptions = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.refresh,
      maxStale: const Duration(minutes: 30),
      keyBuilder: (RequestOptions request) => request.path,
    );
    _dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
  }

  Future<List<Recipe>> getRandomRecipes() async {
    try {
      final response = await _dio.get(
        '/recipes/random',
        queryParameters: {
          'apiKey': ApiConstants.apiKey,
          'number': 10,
          'limitLicense': true,
        },
      );

      final List<dynamic> recipesJson = response.data['recipes'];

      final recipes =
          recipesJson.map<Recipe>((json) => _parseRecipe(json)).toList();

      return recipes;
    } on DioException catch (e) {
      throw Exception('Failed to load random recipes: ${e.message}');
    } catch (e) {
      throw Exception('An unknown error occurred: $e');
    }
  }

  Future<Recipe> getRecipeInformation(int id) async {
    try {
      final response = await _dio.get(
        '/recipes/informationBulk',
        queryParameters: {
          'apiKey': ApiConstants.apiKey,
          'ids': "$id",
        },
      );

      final List<dynamic> recipesJson = response.data;

      final recipes =
          recipesJson.map<Recipe>((json) => _parseRecipe(json)).toList();

      if(recipes.isEmpty) {
        throw Exception('This Recipe is not exist');
      } else {
        return recipes.first;
      }

    } on DioException catch (e) {
      throw Exception('Failed to load recipe information: ${e.message}');
    } catch (e) {
      throw Exception('An unknown error occurred: $e');
    }
  }

  Recipe _parseRecipe(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] is int ? json['id'] as int : 0,
      title: json['title'] as String? ?? 'Unknown Recipe',
      image: json['image'] as String? ?? '',
      readyInMinutes: (json['readyInMinutes'] is int)
          ? json['readyInMinutes'] as int
          : (json['readyInMinutes'] is num
              ? (json['readyInMinutes'] as num).toInt()
              : 0),
      servings: (json['servings'] is int)
          ? json['servings'] as int
          : (json['servings'] is num ? (json['servings'] as num).toInt() : 0),
      sourceUrl: json['sourceUrl'] as String? ?? '',
      vegetarian: json['vegetarian'] as bool? ?? false,
      vegan: json['vegan'] as bool? ?? false,
      glutenFree: json['glutenFree'] as bool? ?? false,
      dairyFree: json['dairyFree'] as bool? ?? false,
      healthScore: (json['healthScore'] is num)
          ? (json['healthScore'] as num).toDouble()
          : 0.0,
      summary: json['summary'] as String? ?? '',
      extendedIngredients: (json['extendedIngredients'] as List<dynamic>? ?? [])
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      analyzedInstructions:
          (json['analyzedInstructions'] as List<dynamic>? ?? [])
              .map((e) => Instruction.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Future<List<String>> autocompleteIngredients(String query, {int number = 10}) async {
    try {
      final response = await _dio.get(
        '/food/ingredients/autocomplete',
        queryParameters: {
          'query': query,
          'number': number,
          'apiKey': ApiConstants.apiKey,
        },
      );

      final List<dynamic> data = response.data as List<dynamic>;
      return data.map<String>((item) => item['name'] as String).toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch autocomplete ingredients: ${e.message}');
    }
  }

  Future<List<RecipeByIngredients>> findRecipesByIngredients(
      List<String> ingredients, {int number = 10, int ranking = 1}) async {
    if (ingredients.isEmpty) return [];

    try {
      final response = await _dio.get(
        '/recipes/findByIngredients',
        queryParameters: {
          'ingredients': ingredients.join(','),
          'number': number,
          'ranking': ranking,
          'apiKey': ApiConstants.apiKey,
        },
      );

      final List<dynamic> recipesJson = response.data;

      final recipes =
          recipesJson.map<RecipeByIngredients>((json) => _parseRecipeByIngredients(json)).toList();

      return recipes;
    } on DioException catch (e) {
      throw Exception('Failed to find recipes by ingredients: ${e.message}');
    }
  }

  RecipeByIngredients _parseRecipeByIngredients(Map<String, dynamic> json) {
    return RecipeByIngredients(
      id: json['id'] is int ? json['id'] as int : 0,
      title: json['title'] as String? ?? 'Unknown Recipe',
      image: json['image'] as String? ?? '',
      imageType: json['imageType'] as String? ?? '',
      usedIngredientCount: json['usedIngredientCount'] is int ? json['usedIngredientCount'] as int : 0,
      missedIngredientCount: json['missedIngredientCount'] is int ? json['missedIngredientCount'] as int : 0,
      missedIngredients: (json['missedIngredients'] as List<dynamic>? ?? [])
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      usedIngredients: (json['usedIngredients'] as List<dynamic>? ?? [])
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      unusedIngredients: (json['unusedIngredients'] as List<dynamic>? ?? [])
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      likes: json['likes'] is int ? json['likes'] as int : 0,
    );
  }
}
