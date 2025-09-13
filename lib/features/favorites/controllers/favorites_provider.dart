import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/models/recipe.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<Recipe>>(
        (ref) => FavoritesNotifier());

class FavoritesNotifier extends StateNotifier<List<Recipe>> {
  late Box<Recipe> _box;

  FavoritesNotifier() : super([]) {
    _init();
  }

  Future<void> _init() async {
    _box = Hive.box<Recipe>('favorite_recipes');
    state = _box.values.toList();
  }

  void addFavorite(Recipe recipe) {
    _box.add(recipe);
    state = _box.values.toList();
  }

  void removeFavorite(Recipe recipe) {
    final key = _box.keys.firstWhere(
      (k) => _box.get(k)?.id == recipe.id,
      orElse: () => null,
    );
    if (key != null) _box.delete(key);
    state = _box.values.toList();
  }

  bool isFavorite(Recipe recipe) {
    return _box.values.any((r) => r.id == recipe.id);
  }
}
