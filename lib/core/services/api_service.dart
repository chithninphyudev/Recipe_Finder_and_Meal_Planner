import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_finder_and_meal_planner/data/models/ingredient.dart';
import 'package:recipe_finder_and_meal_planner/data/models/instruction.dart';
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
}
